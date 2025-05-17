
import 'package:flutter_clean_architecture/features/country/data/datasources/country_data_source.dart';
import 'package:flutter_clean_architecture/features/country/domain/repositories/country_repository.dart';

import '../../domain/entities/country.dart';

class CountryRepositoryImpl implements CountryRepository {

  final CountryDataSource countryDataSource;

  CountryRepositoryImpl({required this.countryDataSource});

  @override
  Future<List<Country>> getAll() {
    return countryDataSource.getAll();
  }
  
}
