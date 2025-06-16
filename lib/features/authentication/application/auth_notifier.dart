import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validators/validators.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/infrastructure/api_url.dart';
import '../../../core/infrastructure/base_api_service.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthFormState with _$AuthFormState {
  const factory AuthFormState({
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default('REPRESENTATIVE') String role,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _AuthFormState;

  const AuthFormState._();

  bool get isEmailValid => isEmail(email);
  bool get isPhoneValid => phone.length >= 10;
  bool get isPasswordValid => password.length >= 6;
  bool get doPasswordsMatch => password == confirmPassword;

  bool get canLogin => isEmailValid && isPasswordValid && !isLoading;
  bool get isFullNameValid => fullName.trim().isNotEmpty;
  bool get isRoleValid => role.trim().isNotEmpty;

  bool get canSignup =>
      isEmailValid &&
      isPhoneValid &&
      isPasswordValid &&
      doPasswordsMatch &&
      isFullNameValid &&
      isRoleValid &&
      !isLoading;
}

class AuthNotifier extends StateNotifier<AuthFormState> {
  final BaseApiService _apiService;
  AuthNotifier(this._apiService) : super(const AuthFormState());

  void fullNameChanged(String value) {
    state = state.copyWith(fullName: value, errorMessage: null);
  }

  void roleChanged(String value) {
    state = state.copyWith(role: value, errorMessage: null);
  }

  void emailChanged(String value) {
    state = state.copyWith(email: value, errorMessage: null);
  }

  void phoneChanged(String value) {
    state = state.copyWith(phone: value, errorMessage: null);
  }

  void passwordChanged(String value) {
    state = state.copyWith(password: value, errorMessage: null);
  }

  void confirmPasswordChanged(String value) {
    state = state.copyWith(confirmPassword: value, errorMessage: null);
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  Future<void> login() async {
    // Update state to loading
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await _apiService.post(
        ApiUrls.login,
        data: {
          'email': state.email.trim(),
          'password': state.password,
        },
        requiresAuth: false, // Explicitly set to false for login endpoint
      );

      print('Login successful: ${response.data}');

      // Store authentication token and user details from the response
      if (response.data['data'] != null &&
          response.data['data']['accessToken'] != null) {
        final token = response.data['data']['accessToken'] as String;
        final userData = response.data['data']['user'] as Map<String, dynamic>;
        final fullName = (userData['fullName'] as String?) ?? '';
        final userId = userData['id']?.toString() ?? '';

        // Save token and user details
        await _apiService.setAuthToken(token);
        await _apiService.setUserDetails(fullName);
        await _apiService.setUserId(userId);

        // Update state with user details
        state = state.copyWith(
          fullName: fullName,
          isLoading: false,
        );

        print('User $fullName logged in successfully');
      } else {
        throw Exception('Invalid response format: Missing required fields');
      }
    } catch (e) {
      print('Login failed: $e');
      final errorMessage =
          e is DioException && e.response?.data is Map<String, dynamic>
              ? e.response!.data['message']?.toString() ??
                  'Login failed. Please try again.'
              : 'Login failed. Please check your credentials and try again.';

      state = state.copyWith(
        isLoading: false,
        errorMessage: errorMessage,
      );
      rethrow;
    }
  }

  String? validateSignupForm() {
    if (state.fullName.trim().isEmpty) {
      return 'Full name is required.';
    }
    if (state.role.trim().isEmpty) {
      return 'Role is required.';
    }
    if (!state.isEmailValid) {
      return 'Invalid email address.';
    }
    if (!state.isPhoneValid) {
      return 'Phone must be 10 digits.';
    }
    if (!state.isPasswordValid) {
      return 'Password must be at least 6 characters.';
    }
    if (!state.doPasswordsMatch) {
      return 'Passwords do not match.';
    }
    return null;
  }

  Future<void> signup() async {
    final validationError = validateSignupForm();
    if (validationError != null) {
      state = state.copyWith(errorMessage: validationError);
      return;
    }
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await _apiService.post(
        ApiUrls.signup,
        data: {
          'fullName': state.fullName.trim(),
          'email': state.email.trim(),
          'phone': state.phone.trim(),
          'password': state.password,
          'role': state.role,
        },
      );

      print('Signup successful: [32m${response.data}[0m');

      // Store authentication token from the correct response structure
      if (response.data['data'] != null &&
          response.data['data']['accessToken'] != null) {
        final token = response.data['data']['accessToken'];
        final fullName =
            response.data['data']['user']['fullName'] ?? state.fullName;
        await _apiService.setAuthToken(token);
        await _apiService.setUserDetails(fullName);
      }

      state = state.copyWith(isLoading: false);
    } catch (e) {
      print('Signup failed: $e');
      state = state.copyWith(
          isLoading: false, errorMessage: 'Signup failed. Please try again.');
    }
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthFormState>(
  (ref) {
    final apiService = ref.watch(baseApiServiceProvider);
    return AuthNotifier(apiService);
  },
  dependencies: [baseApiServiceProvider],
);
