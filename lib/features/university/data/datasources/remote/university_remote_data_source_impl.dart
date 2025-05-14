import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/features/university/data/models/university_model.dart';

import '../../../domain/entities/university.dart';
import '../university_data_source.dart';

class UniversityRemoteDataSourceImpl extends UniversityDataSource {
  final Dio _dio;

  UniversityRemoteDataSourceImpl(this._dio);

  @override
  Future<List<University>> search(
    String keyword,
    String country,
    int offset,
    int limit,
  ) async {
    final response = await _dio.get('http://universities.hipolabs.com/search?offset=$offset&limit=$limit');
    final List data = response.data;
    return data.map((json) => UniversityModel.fromJson(json)).toList();
  }
}
