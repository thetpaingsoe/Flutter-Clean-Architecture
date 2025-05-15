import 'package:dio/dio.dart';
import 'dart:developer';

import '../../config/config.dart';

class AppLoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (Config.isDebugMode) {
      log('➡️ REQUEST: [${options.method}] ${options.uri}');
      log('Headers: ${options.headers}');
      log('Body: ${options.data}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (Config.isDebugMode) {
      log(
        '✅ RESPONSE: [${response.statusCode}] ${response.requestOptions.uri}',
      );
      log('Response: ${response.data}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (Config.isDebugMode) {
      log('❌ ERROR: [${err.response?.statusCode}] ${err.requestOptions.uri}');
      log('Message: ${err.message}');
      log('Data: ${err.response?.data}');
    }
    super.onError(err, handler);
  }
}
