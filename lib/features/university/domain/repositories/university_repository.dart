import '../../../../core/network/api_response.dart';
import '../entities/university.dart';

abstract class UniversityRepository {
  Future<ApiResponse<List<University>>> search(String keyword, String country, int offset, int limit);
}