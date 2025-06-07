import '../../../../core/network/api_response.dart';
import '../entities/params/search_university_params.dart';
import '../entities/university.dart';

abstract class UniversityRepository {
  Future<ApiResponse<List<University>>> search({
    required SearchUniversityParams params,
  });
}
