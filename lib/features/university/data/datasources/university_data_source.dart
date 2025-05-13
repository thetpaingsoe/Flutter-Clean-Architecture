


import '../../domain/entities/university.dart';

abstract class UniversityDataSource {
  Future<List<University>> search(String keyword, String country, int offset, int limit);
}