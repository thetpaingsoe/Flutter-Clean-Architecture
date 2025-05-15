import 'package:dio/dio.dart';
import 'exceptions.dart';

class ErrorHandler {
  static DioException handle(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return NetworkException("Connection timeout", e.response?.statusCode ?? 0);

      case DioExceptionType.badResponse:
        return _handleStatusCode(e);

      case DioExceptionType.cancel:
        return CancelException("Request cancelled", e.response?.statusCode ?? 0);

      case DioExceptionType.unknown:
        return UnknownException("Something went wrong", e.response?.statusCode ?? 0);

      default:
        return UnknownException("Unknown error", e.response?.statusCode ?? 0);
    }
  }

  static DioException _handleStatusCode(DioException e) {
    final code = e.response?.statusCode ?? 0;
    final message = e.response?.data?['message'] ?? "Unknown error";

    if (code >= 400 && code < 500) {
      return ClientException(message, code);
    } else if (code >= 500) {
      return ServerException("Server error: $message", code);
    } else {
      return UnknownException("Unhandled status: $code", code);
    }
  }
}
