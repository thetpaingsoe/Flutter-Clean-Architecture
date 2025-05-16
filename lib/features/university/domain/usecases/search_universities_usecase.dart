import 'package:flutter_clean_architecture/core/network/api_response.dart';

import '../entities/university.dart';
import '../repositories/university_repository.dart';

class SearchUniversitiesUsercase {
  final UniversityRepository universityRepository;

  SearchUniversitiesUsercase({required this.universityRepository});

  Future<ApiResponse<List<University>>> call({
    required String keyword,
    required String country,
    required int limit,
    required int offset,
  }) {
    return universityRepository.search(
      keyword: keyword,
      country: country,
      limit: limit,
      offset: offset,
    );
  }
}
