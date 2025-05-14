

import '../../../../core/network/api_response.dart';
import '../../domain/entities/university.dart';
import '../../domain/repositories/university_repository.dart';
import '../datasources/university_data_source.dart';

class UniversityRepositoryImpl extends UniversityRepository {

  final UniversityDataSource universityRemoteDataSource;
  UniversityRepositoryImpl({required this.universityRemoteDataSource});

  @override
  Future<ApiResponse<List<University>>> search(String keyword, String country, int offset, int limit) {
    return universityRemoteDataSource.search(keyword, country, offset, limit);
  }

}