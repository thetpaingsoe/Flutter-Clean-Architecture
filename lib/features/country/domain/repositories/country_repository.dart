import 'package:flutter_clean_architecture/features/country/domain/entities/country.dart';

abstract class CountryRepository {
  Future<List<Country>> getAll();
}
