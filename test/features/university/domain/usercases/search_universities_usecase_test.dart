// ignore_for_file: unused_result

import 'package:flutter_clean_architecture/core/network/api_response.dart';
import 'package:flutter_clean_architecture/features/university/domain/entities/params/search_university_params.dart';
import 'package:flutter_clean_architecture/features/university/domain/entities/university.dart';
import 'package:flutter_clean_architecture/features/university/domain/repositories/university_repository.dart';
import 'package:flutter_clean_architecture/features/university/domain/usecases/search_universities_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<UniversityRepository>()])
import 'package:mockito/mockito.dart';

import 'search_universities_usecase_test.mocks.dart';

void main() {
  late MockUniversityRepository universityRepository;
  late SearchUniversitiesUsercase searchUniversitiesUsercase;

  setUp(() {
    universityRepository = MockUniversityRepository();
    searchUniversitiesUsercase = SearchUniversitiesUsercase(
      universityRepository: universityRepository,
    );
  });

  test(
    "when usecase is called, it should return the list of universities.",
    () async {
      final universities = ApiResponse.success([
        University(
          name: 'USA',
          country: "United States",
          stateProvince: 'California',
          webPages: ['https://www.example.com'],
          countryCode: 'US',
          domains: ['example.com'],
        ),
      ], statusCode: 200);
      when(
        universityRepository.search(params: argThat(
          isA<SearchUniversityParams>() // Ensure it's the correct type            
            ..having((p) => p.keyword, 'keyword', "") // Check keyword property
            ..having((p) => p.offset, 'offset', 0)    // Check offset property
            ..having((p) => p.limit, 'limit', 10),    // Check limit property
          named: 'params', // If 'params' is a named argument
        ),),
      ).thenAnswer((_) async => universities);

      final result = await searchUniversitiesUsercase.call(
        params: SearchUniversityParams(
          keyword: "",
          offset: 0,
          limit: 10,
        ),
      );
      expect(result, universities);
    },
  );
}
