

import '../entities/university.dart';
import '../repositories/university_repository.dart';

class SearchUniversities {
  final UniversityRepository universityRepository;

  SearchUniversities({required this.universityRepository});

  Future<List<University>> call(String keyword, String country, int offset, int limit) {
    return universityRepository.search(keyword, country, offset, limit);
  }
}