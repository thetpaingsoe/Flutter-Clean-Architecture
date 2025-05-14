
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/features/university/presentation/university_injections.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;
final dio = Dio();

Future<void> initInjections() async {
  await initUniversityInjection();
}