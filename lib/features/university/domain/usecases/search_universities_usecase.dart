

import 'package:flutter_clean_architecture/core/network/api_response.dart';

import '../entities/university.dart';
import '../repositories/university_repository.dart';

class SearchUniversitiesUsercase {
  final UniversityRepository universityRepository;

  SearchUniversitiesUsercase({required this.universityRepository});

  Future<ApiResponse<List<University>>> call(String keyword, String country, int offset, int limit) {
    return universityRepository.search(keyword, country, offset, limit);
  }
}