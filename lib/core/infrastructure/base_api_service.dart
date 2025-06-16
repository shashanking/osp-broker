// Core infrastructure: Base API service using Dio
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'api_url.dart';
import 'providers.dart';

final baseApiServiceProvider = Provider<BaseApiService>((ref) {
  final dio = ref.watch(dioProvider);
  final authBox = ref.watch(authBoxProvider);
  return BaseApiService(dio, authBox);
}, dependencies: [dioProvider, authBoxProvider]);

class BaseApiService {
  final Dio _dio;
  final Box _authBox;
  String? _authToken;

  BaseApiService(this._dio, this._authBox) {
    _authToken = _authBox.get('token') as String?;
  }

  Future<void> setAuthToken(String token) async {
    _authToken = token;
    await _authBox.delete(token);
    await _authBox.put('token', token);
  }

  Future<void> setUserDetails(String fullName) async {
    await _authBox.put('fullName', fullName);
  }

  Future<void> setUserId(String userId) async {
    await _authBox.put('userId', userId);
  }

  Future<void> clearAuthToken() async {
    _authToken = null;
    await _authBox.delete('token');
    await _authBox.delete('fullName');
    await _authBox.delete('userId');
  }

  String? get authToken => _authToken;
  bool get isAuthenticated => _authToken != null;

  /// Creates request options with proper headers
  /// 
  /// [options] Existing options to extend
  /// [requiresAuth] Whether to include the auth token
  Options _getOptions({
    Options? options,
    bool requiresAuth = true,
  }) {
    options ??= Options();
    options.headers ??= {};
    
    // Add content type if not set
    options.headers!.putIfAbsent(
      'Content-Type',
      () => 'application/json',
    );
    
    // Add auth token if required and available
    if (requiresAuth) {
      if (_authToken == null) {
        throw Exception('Authentication required but no token available');
      }
      options.headers!['Authorization'] = 'Bearer $_authToken';
    }
    
    return options;
  }
  
  /// Handles Dio errors and logs them appropriately
  void _handleDioError(DioException e) {
    if (e.response != null) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx
      developer.log(
        'API Error Response: ${e.response?.statusCode} - ${e.response?.statusMessage}',
        name: 'API',
        error: e.response?.data,
      );
      
      // Handle specific status codes
      if (e.response?.statusCode == 401) {
        // Token expired or invalid
        developer.log('Authentication error - token may be expired or invalid', name: 'API');
        // Optionally clear auth state here if needed
        // clearAuthToken();
      }
    } else {
      // Something happened in setting up or sending the request
      developer.log(
        'API Request Error: ${e.message}',
        name: 'API',
        error: e,
        stackTrace: e.stackTrace,
      );
    }
  }

  /// Makes a GET request to the specified endpoint
  /// 
  /// [endpoint] The API endpoint (without base URL)
  /// [queryParameters] Optional query parameters
  /// [requiresAuth] Whether this request requires authentication (default: true)
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool requiresAuth = true,
  }) async {
    try {
      final options = _getOptions(requiresAuth: requiresAuth);
      developer.log('GET $endpoint', name: 'API');
      return await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  /// Makes a POST request to the specified endpoint
  /// 
  /// [endpoint] The API endpoint (without base URL)
  /// [data] The request body data
  /// [requiresAuth] Whether this request requires authentication (default: true)
  Future<Response> post(
    String endpoint, {
    dynamic data,
    bool requiresAuth = true,
  }) async {
    try {
      final options = _getOptions(requiresAuth: requiresAuth);
      developer.log('POST $endpoint', name: 'API');
      return await _dio.post(
        endpoint,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  /// Makes a PUT request to the specified endpoint
  /// 
  /// [endpoint] The API endpoint (without base URL)
  /// [data] The request body data
  /// [requiresAuth] Whether this request requires authentication (default: true)
  Future<Response> put(
    String endpoint, {
    dynamic data,
    bool requiresAuth = true,
  }) async {
    try {
      final options = _getOptions(requiresAuth: requiresAuth);
      developer.log('PUT $endpoint', name: 'API');
      return await _dio.put(
        endpoint,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  /// Makes a DELETE request to the specified endpoint
  /// 
  /// [endpoint] The API endpoint (without base URL)
  /// [data] Optional request body data
  /// [requiresAuth] Whether this request requires authentication (default: true)
  Future<Response> delete(
    String endpoint, {
    dynamic data,
    bool requiresAuth = true,
  }) async {
    try {
      final options = _getOptions(requiresAuth: requiresAuth);
      developer.log('DELETE $endpoint', name: 'API');
      return await _dio.delete(
        endpoint,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }
}
