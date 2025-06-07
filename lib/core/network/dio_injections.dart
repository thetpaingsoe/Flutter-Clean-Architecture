import 'package:flutter_clean_architecture/core/network/dio_client.dart';

import '../di/injections.dart';

initDioInjections() {
  di.registerSingleton<DioClient>(
    DioClient("http://universities.hipolabs.com"),
  );
}
