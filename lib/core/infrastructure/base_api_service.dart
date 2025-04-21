// Core infrastructure: Base API service using Dio
import 'package:dio/dio.dart';
import 'api_url.dart';

class BaseApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiUrls.baseUrl));

  // Example GET request
  Future<Response> get(String endpoint) async {
    return await _dio.get(endpoint);
  }

  // Add POST, PUT, DELETE as needed
}
