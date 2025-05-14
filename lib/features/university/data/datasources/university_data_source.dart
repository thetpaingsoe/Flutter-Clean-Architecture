


import '../../../../core/network/api_response.dart';
import '../../domain/entities/university.dart';

abstract class UniversityDataSource {

  String searchUniversityUrl = "/search";
  Future<ApiResponse<List<University>>> search(String? keyword, String? country, int? offset, int? limit);

}