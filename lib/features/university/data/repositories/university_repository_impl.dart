import '../../../../core/network/api_response.dart';
import '../../domain/entities/params/search_university_params.dart';
import '../../domain/entities/university.dart';
import '../../domain/repositories/university_repository.dart';
import '../datasources/university_data_source.dart';

class UniversityRepositoryImpl extends UniversityRepository {
  final UniversityDataSource universityRemoteDataSource;
  UniversityRepositoryImpl({required this.universityRemoteDataSource});

  @override
  Future<ApiResponse<List<University>>> search({
    required SearchUniversityParams params,
  }) {
    return universityRemoteDataSource.search(
      params.keyword,
      params.country,
      params.offset,
      params.limit,
    );
  }
}
