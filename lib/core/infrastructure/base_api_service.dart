// Core infrastructure: Base API service using Dio
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_url.dart';
import 'providers.dart';

final baseApiServiceProvider = Provider<BaseApiService>((ref) {
  final dio = ref.watch(dioProvider);
  final authBox = ref.watch(authBoxProvider);
  return BaseApiService(dio, authBox);
});

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

  Future<void> clearAuthToken() async {
    _authToken = null;
    await _authBox.delete('token');
    await _authBox.delete('fullName');
  }

  String? get authToken => _authToken;
  bool get isAuthenticated => _authToken != null;

  Options _getOptions({Options? options}) {
    options ??= Options();
    if (_authToken != null) {
      options.headers ??= {};
      options.headers!['Authorization'] = 'Bearer $_authToken';
    }
    return options;
  }

  Future<Response> get(String endpoint, {bool requireAuth = false}) async {
    final options = _getOptions();
    if (requireAuth && !isAuthenticated) {
      throw Exception('Authentication required for this request');
    }
    return await _dio.get(endpoint, options: options);
  }

  Future<Response> post(String endpoint,
      {required Map<String, dynamic> data, bool requireAuth = false}) async {
    final options = _getOptions();
    if (requireAuth && !isAuthenticated) {
      throw Exception('Authentication required for this request');
    }
    return await _dio.post(endpoint, data: data, options: options);
  }

  Future<Response> put(String endpoint,
      {required Map<String, dynamic> data, bool requireAuth = false}) async {
    final options = _getOptions();
    if (requireAuth && !isAuthenticated) {
      throw Exception('Authentication required for this request');
    }
    return await _dio.put(endpoint, data: data, options: options);
  }

  Future<Response> delete(String endpoint, {bool requireAuth = false}) async {
    final options = _getOptions();
    if (requireAuth && !isAuthenticated) {
      throw Exception('Authentication required for this request');
    }
    return await _dio.delete(endpoint, options: options);
  }
}
