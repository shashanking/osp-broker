import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/infrastructure/base_api_service.dart';
import '../domain/profile_model.dart';

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
    developer.log('Updated auth tokens in state', name: 'ProfileNotifier');
  }

  /// Fetches the user profile from the API
  /// 
  /// [userId] The ID of the user whose profile to fetch
  /// [forceRefresh] Whether to force a fresh fetch from the server
  Future<void> _fetchUserProfile(String userId) async {
    print('[ProfileNotifier] _fetchUserProfile called for user: $userId');
    state = state.copyWith(isLoading: true, errorMessage: null);
    
    try {
      print('[ProfileNotifier] Making API call to fetch profile...');
      
      // Make the authenticated request
      final response = await _apiService.get(
        '/user/userProfile/$userId',
        requiresAuth: true,
      );
      
      print('[ProfileNotifier] API response received: ${response.statusCode}');
      print('[ProfileNotifier] Response data: ${response.data}');
      
      // Check if we got a successful response
      if (response.statusCode == 200 && response.data['success'] == true) {
        try {
          final profile = UserProfile.fromJson(response.data);
          print('[ProfileNotifier] Profile loaded successfully: ${profile.headLine}');
          
          state = state.copyWith(
            userProfile: profile,
            isLoading: false,
            currentProfileId: userId,
            errorMessage: null,
          );
        } catch (e) {
          print('[ProfileNotifier] Error parsing profile data: $e');
          throw Exception('Failed to parse profile data');
        }
      } else {
        throw Exception(response.data['message'] ?? 'Failed to load profile');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data is Map 
          ? e.response?.data['message'] ?? e.message ?? 'Failed to fetch profile'
          : 'Failed to connect to server';
          
      print('[ProfileNotifier] Dio error: $errorMessage');
      state = state.copyWith(
        isLoading: false,
        errorMessage: errorMessage,
      );
      
      rethrow;
    } catch (e, stackTrace) {
      developer.log(
        'Unexpected error fetching profile',
        name: 'ProfileNotifier',
        error: e,
        stackTrace: stackTrace,
      );
      
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'An unexpected error occurred',
      );
      
      rethrow;
    }
  }
  
  /// Updates the user's profile
  Future<void> updateProfile(Map<String, dynamic> profileData) async {
    final userId = state.currentProfileId;
    if (userId == null) {
      throw Exception('No user ID available for updating profile');
    }
    
    state = state.copyWith(isLoading: true, errorMessage: null);
    
    try {
      final response = await _apiService.put(
        '/user/updateProfile/$userId',
        data: profileData,
        requiresAuth: true,
      );
      
      if (response.statusCode == 200 && response.data['success'] == true) {
        // Refresh the profile data after successful update
        await _fetchUserProfile(userId);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to update profile');
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
      rethrow;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

final profileNotifierProvider = StateNotifierProvider<ProfileNotifier, ProfileState>(
  (ref) {
    final apiService = ref.watch(baseApiServiceProvider);
    return ProfileNotifier(apiService);
  },
  dependencies: [baseApiServiceProvider],
);
