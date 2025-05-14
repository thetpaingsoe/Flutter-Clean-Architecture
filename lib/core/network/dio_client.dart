import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/network/dio_logger.dart';

import 'error_handler.dart';

class DioClient {
  final Dio _dio;

  DioClient(String baseUrl) 
    : _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl, 
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        responseType: ResponseType.json
      )) {
        _dio.interceptors.addAll([
          AppLoggerInterceptor(),
          InterceptorsWrapper(
            onError: (e, handler) {
              final customError = ErrorHandler.handle(e);
              handler.reject(customError);
            },
          ),
        ]);
      }
    Dio get instance => _dio;
}