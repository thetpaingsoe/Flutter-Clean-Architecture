import 'package:flutter_clean_architecture/features/country/domain/entities/country.dart';
import 'package:flutter_clean_architecture/features/country/domain/usecases/get_all_country_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<CountryRepository>()])
import 'package:flutter_clean_architecture/features/country/domain/repositories/country_repository.dart';
import 'package:mockito/mockito.dart';

import 'get_all_country_usecase_test.mocks.dart';

void main() {
  late MockCountryRepository countryRepository;
  late GetAllCountryUsecase getAllCountryUsecase;

  setUp(() {
    countryRepository = MockCountryRepository();
    getAllCountryUsecase = GetAllCountryUsecase(
      countryRepository: countryRepository,
    );
  });

  test("when usecase is called, it should return the list<country>", () async {
    final countries = [Country(name: 'USA')];
    when(countryRepository.getAll()).thenAnswer((_) async => countries);

    final result = await getAllCountryUsecase.call();
    expect(result, countries);
  });
}
