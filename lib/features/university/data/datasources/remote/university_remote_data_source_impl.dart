import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/network/dio_client.dart';
import 'package:flutter_clean_architecture/features/university/data/models/university_model.dart';

import '../../../../../core/network/api_response.dart';
import '../../../domain/entities/university.dart';
import '../university_data_source.dart';

class UniversityRemoteDataSourceImpl extends UniversityDataSource {
  final Dio _dio;

  UniversityRemoteDataSourceImpl({required DioClient dioClient})
    : _dio = dioClient.instance;

  @override
  Future<ApiResponse<List<University>>> search(
    String? keyword,
    String? country,
    int? offset,
    int? limit,
  ) async {
    try {
      String url = "${super.searchUniversityUrl}?offset=$offset&limit=$limit";
      url += keyword!.isNotEmpty ? '&name=$keyword': '';
      url += country!.isNotEmpty ? '&country=$country' : '';
      final response = await _dio.get(url);
      final data =
          (response.data as List)
              .map((e) => UniversityModel.fromJson(e))
              .toList();
      return ApiResponse.success(data, statusCode: response.statusCode);
    } on DioException catch (e) {
      return ApiResponse.error(
        e.message ?? 'Unknown error',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
