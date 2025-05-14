import '../entities/university.dart';

abstract class UniversityRepository {
  Future<List<University>> search(String keyword, String country, int offset, int limit);
}