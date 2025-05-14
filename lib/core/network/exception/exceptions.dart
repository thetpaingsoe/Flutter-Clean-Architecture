import 'package:dio/dio.dart';

class NetworkException extends DioException {
  NetworkException(String message)
      : super(requestOptions: RequestOptions(path: ''), message: message);
}

class ServerException extends DioException {
  ServerException(String message)
      : super(requestOptions: RequestOptions(path: ''), message: message);
}

class ClientException extends DioException {
  ClientException(String message)
      : super(requestOptions: RequestOptions(path: ''), message: message);
}

class CancelException extends DioException {
  CancelException(String message)
      : super(requestOptions: RequestOptions(path: ''), message: message);
}

class UnknownException extends DioException {
  UnknownException(String message)
      : super(requestOptions: RequestOptions(path: ''), message: message);
}
