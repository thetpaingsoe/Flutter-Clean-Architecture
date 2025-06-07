import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/network/dio_injections.dart';
import 'package:flutter_clean_architecture/features/university/university_injections.dart';
import 'package:get_it/get_it.dart';

import '../../features/country/country_injections.dart';

final di = GetIt.instance;
final dio = Dio();

Future<void> initInjections() async {
  await initDioInjections();
  await initUniversityInjection();
  await initCountryInjection();
}
