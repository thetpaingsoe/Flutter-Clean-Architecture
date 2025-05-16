import 'package:flutter_clean_architecture/core/network/api_response.dart';

import '../entities/params/search_university_params.dart';
import '../entities/university.dart';
import '../repositories/university_repository.dart';

class SearchUniversitiesUsercase {
  final UniversityRepository universityRepository;

  SearchUniversitiesUsercase({required this.universityRepository});

  Future<ApiResponse<List<University>>> call({
    required SearchUniversityParams params
  }) {
    return universityRepository.search(
      params: params
    );
  }
}
