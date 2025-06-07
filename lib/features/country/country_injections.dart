
import 'package:flutter_clean_architecture/core/config/config.dart';
import 'package:flutter_clean_architecture/core/config/constants.dart';
import 'package:flutter_clean_architecture/features/country/data/datasources/local/country_local_data_source.dart';
import 'package:flutter_clean_architecture/features/country/data/datasources/server/country_server_data_source.dart';

import '../../core/di/injections.dart';
import 'data/datasources/country_data_source.dart';
import 'data/repositories/country_repository_impl.dart';
import 'domain/repositories/country_repository.dart';
import 'domain/usecases/get_all_country_usecase.dart';

initCountryInjection() {

  // Init DataSouce Based on the DataScoure Config
  if(Config.dataSource == DataSource.server) {
    di.registerSingleton<CountryDataSource>(CountryServerDataSourceImpl());
  }else {
    di.registerSingleton<CountryDataSource>(CountryLocalDataSourceImpl());
  }
  
  // Init Repo and UseCases
  di.registerSingleton<CountryRepository>(CountryRepositoryImpl(countryDataSource: di.get()));
  di.registerSingleton<GetAllCountryUsecase>(GetAllCountryUsecase(countryRepository: di.get()));
}
