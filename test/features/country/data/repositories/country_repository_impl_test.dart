import 'package:flutter_clean_architecture/features/country/data/datasources/country_data_source.dart';
import 'package:flutter_clean_architecture/features/country/data/repositories/country_repository_impl.dart';
import 'package:flutter_clean_architecture/features/country/domain/entities/country.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'country_repository_impl_test.mocks.dart';

@GenerateMocks([CountryDataSource])
void main() {
  late CountryRepositoryImpl repository;
  late MockCountryDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockCountryDataSource();
    repository = CountryRepositoryImpl(countryDataSource: mockDataSource);
  });

  final testCountries = [Country(name: 'USA'), Country(name: 'Canada')];

  test('should return countries from data source', () async {
    when(mockDataSource.getAll()).thenAnswer((_) async => testCountries);

    final result = await repository.getAll();

    expect(result, testCountries);
    verify(mockDataSource.getAll()).called(1);
  });

  test('should propagate errors from data source', () async {
    when(mockDataSource.getAll()).thenThrow(Exception('DB error'));

    expect(() => repository.getAll(), throwsException);
  });
}
