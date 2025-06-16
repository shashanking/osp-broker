import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/infrastructure/base_api_service.dart';
import 'profile_model.dart';

part 'profile_notifier.freezed.dart';

// Models moved to profile_model.dart

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserProfile? userProfile,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(null) String? currentProfileId,
    @Default(null) String? accessToken,
    @Default(null) String? refreshToken,
  }) = _ProfileState;
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  final BaseApiService _apiService;
  ProfileNotifier(this._apiService) : super(const ProfileState());

  /// Sets the current profile ID and optionally fetches the profile
  void setCurrentProfileId(String? profileId, {bool fetchProfile = true}) {
    print('[ProfileNotifier] setCurrentProfileId called with profileId: $profileId, fetchProfile: $fetchProfile');
    
    if (profileId == null) {
      print('[ProfileNotifier] Clearing profile state');
      state = state.copyWith(currentProfileId: null, userProfile: null);
      return;
    }

    print('[ProfileNotifier] Updating currentProfileId to: $profileId');
    state = state.copyWith(currentProfileId: profileId);
    
    if (fetchProfile) {
      print('[ProfileNotifier] Fetching profile for ID: $profileId');
      _fetchUserProfile(profileId);
    } else {
      print('[ProfileNotifier] Skipping profile fetch (fetchProfile: false)');
    }
  }

  /// Fetches the profile for the current profile ID
  Future<void> fetchCurrentProfile() async {
    final profileId = state.currentProfileId;
    if (profileId == null) return;
    await _fetchUserProfile(profileId);
  }

  /// Updates the auth tokens in the state
  void updateAuthTokens({String? accessToken, String? refreshToken}) {
    state = state.copyWith(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    print('[ProfileNotifier] Updated auth tokens in state');
  }

  /// Gets the current auth header
  Map<String, String>? get _authHeaders {
    if (state.accessToken == null) return null;
    return {
      'Cookie': 'accessToken=${state.accessToken}${state.refreshToken != null ? '; refreshToken=${state.refreshToken}' : ''}',
    };
  }

  Future<void> _fetchUserProfile(String userId) async {
    print('[ProfileNotifier] _fetchUserProfile called for user: $userId');
    state = state.copyWith(isLoading: true, errorMessage: null);
    
    try {
      print('[ProfileNotifier] Making API call to fetch profile...');
      
      // Prepare headers with auth tokens if available
      final headers = _authHeaders;
      print('[ProfileNotifier] Using auth headers: $headers');
      
      // Make the request with the current auth state
      final response = await _apiService.get(
        '/user/userProfile/$userId',
        requireAuth: true,
      );
      
      print('[ProfileNotifier] API response received: ${response.statusCode}');
      print('[ProfileNotifier] Response data: ${response.data}');
      
      // Check if we got a successful response
      if (response.statusCode == 200 && response.data['success'] == true) {
        final data = response.data['data'];
        if (data == null) {
          throw Exception('User profile data is null');
        }
        
        print('[ProfileNotifier] Parsing profile data...');
        final profile = UserProfile.fromJson(data);
        
        print('[ProfileNotifier] Profile loaded successfully: ${profile.headLine}');
        state = state.copyWith(
          userProfile: profile, 
          isLoading: false,
          currentProfileId: userId,
          errorMessage: null,
        );
      } else {
        throw Exception(response.data['message'] ?? 'Failed to load profile');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data?['message'] ?? e.message ?? 'Failed to fetch profile';
      print('[ProfileNotifier] Dio error: $errorMessage');
      state = state.copyWith(
        isLoading: false,
        errorMessage: errorMessage,
      );
      rethrow;
    } catch (e) {
      print('[ProfileNotifier] Error fetching profile: $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to fetch user profile: $e',
      );
      rethrow;
    }
  }
}

final profileNotifierProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  final apiService = ref.watch(baseApiServiceProvider);
  return ProfileNotifier(apiService);
}, dependencies: [
  baseApiServiceProvider,
]);
