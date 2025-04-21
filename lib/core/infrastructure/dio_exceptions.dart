// Core infrastructure: Dio exceptions handler
import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  final String message;
  DioExceptions(this.message);

  factory DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return DioExceptions('Request to API server was cancelled');
      case DioExceptionType.connectionTimeout:
        return DioExceptions('Connection timeout with API server');
      case DioExceptionType.unknown:
        return DioExceptions('Connection to API server failed due to internet connection');
      case DioExceptionType.receiveTimeout:
        return DioExceptions('Receive timeout in connection with API server');
      case DioExceptionType.badResponse:
        return DioExceptions('Received invalid status code: ${dioError.response?.statusCode}');
      case DioExceptionType.sendTimeout:
        return DioExceptions('Send timeout in connection with API server');
      default:
        return DioExceptions('Unexpected error occurred');
    }
  }

  @override
  String toString() => message;
}
