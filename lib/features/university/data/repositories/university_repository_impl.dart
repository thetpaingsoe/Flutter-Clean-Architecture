

import '../../domain/entities/university.dart';
import '../../domain/repositories/university_repository.dart';
import '../datasources/university_remote_data_source.dart';

class UniversityRepositoryImpl extends UniversityRepository {

  final UniversityRemoteDataSource universityRemoteDataSource;
  UniversityRepositoryImpl({required this.universityRemoteDataSource});

  @override
  Future<List<University>> search(String keyword, String country, int offset, int limit) {
    return universityRemoteDataSource.search(keyword, country, offset, limit);
  }

}