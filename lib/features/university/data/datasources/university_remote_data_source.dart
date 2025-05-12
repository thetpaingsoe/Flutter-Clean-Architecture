


import '../../domain/entities/university.dart';

abstract class UniversityRemoteDataSource {
  Future<List<University>> search(String keyword, String country, int offset, int limit);
}