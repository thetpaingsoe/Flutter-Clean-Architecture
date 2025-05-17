
import 'package:flutter_clean_architecture/features/country/domain/entities/country.dart';

import '../repositories/country_repository.dart';

class GetAllCountryUsecase {
  final CountryRepository countryRepository;

  GetAllCountryUsecase({required this.countryRepository});

  Future<List<Country>> call() async {
    return await countryRepository.getAll();
  }
}