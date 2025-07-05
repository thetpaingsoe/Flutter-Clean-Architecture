import 'package:flutter_clean_architecture/core/network/api_response.dart';
import 'package:flutter_clean_architecture/features/university/data/repositories/university_repository_impl.dart';
import 'package:flutter_clean_architecture/features/university/data/datasources/university_data_source.dart';
import 'package:flutter_clean_architecture/features/university/domain/entities/params/search_university_params.dart';
import 'package:flutter_clean_architecture/features/university/domain/entities/university.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'university_repository_impl_test.mocks.dart';

@GenerateMocks([UniversityDataSource])
void main() {
  late UniversityRepositoryImpl repository;
  late MockUniversityDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockUniversityDataSource();
    repository = UniversityRepositoryImpl(
      universityRemoteDataSource: mockDataSource,
    );
  });

  test('should return universities from data source', () async {
    final testUniversities = [
      University(
        name: 'University A',
        stateProvince: 'State A',
        country: 'Country A',
        countryCode: 'CA',
        webPages: ['www.universityA.edu'],
        domains: ['universityA.edu'],
      ),
      University(
        name: 'University B',
        stateProvince: 'State B',
        country: 'Country B',
        countryCode: 'CB',
        webPages: ['www.universityB.edu'],
        domains: ['universityB.edu'],
      ),
    ];

    when(mockDataSource.search(any, any, any, any)).thenAnswer(
      (_) async => ApiResponse.success(testUniversities, statusCode: 200),
    );

    SearchUniversityParams params = SearchUniversityParams(
      keyword: 'University',
      country: '',
      offset: 0,
      limit: 10,
    );
    final result = await repository.search(params: params);

    expect(result.data, testUniversities);
    verify(mockDataSource.search('University', '', 0, 10)).called(1);
  });

  test('should propagate errors from data source', () async {
    when(
      mockDataSource.search(any, any, any, any),
    ).thenThrow(Exception('DB error'));

    SearchUniversityParams params = SearchUniversityParams(
      keyword: 'University',
      country: '',
      offset: 0,
      limit: 10,
    );

    expect(() => repository.search(params: params), throwsException);
  });
}
