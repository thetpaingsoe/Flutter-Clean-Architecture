import 'package:dio/dio.dart';

class NetworkException extends DioException {
  NetworkException(String message, int statusCode)
    : super(
        requestOptions: RequestOptions(path: ''),
        message: message,
        response: Response(
          statusCode: statusCode,
          requestOptions: RequestOptions(path: ''),
        ),
      );
}

class ServerException extends DioException {
  ServerException(String message, int statusCode)
    : super(
        requestOptions: RequestOptions(path: ''),
        message: message,
        response: Response(
          statusCode: statusCode,
          requestOptions: RequestOptions(path: ''),
        ),
      );
}

class ClientException extends DioException {
  ClientException(String message, int statusCode)
    : super(
        requestOptions: RequestOptions(path: ''),
        message: message,
        response: Response(
          statusCode: statusCode,
          requestOptions: RequestOptions(path: ''),
        ),
      );
}

class CancelException extends DioException {
  CancelException(String message, int statusCode)
    : super(
        requestOptions: RequestOptions(path: ''),
        message: message,
        response: Response(
          statusCode: statusCode,
          requestOptions: RequestOptions(path: ''),
        ),
      );
}

class UnknownException extends DioException {
  UnknownException(String message, int statusCode)
    : super(
        requestOptions: RequestOptions(path: ''),
        message: message,
        response: Response(
          statusCode: statusCode,
          requestOptions: RequestOptions(path: ''),
        ),
      );
}
