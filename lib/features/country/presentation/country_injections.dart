
import '../../../core/di/injections.dart';
import '../data/datasources/country_data_source.dart';
import '../data/datasources/local/country_local_data_source.dart';
import '../data/repositories/country_repository_impl.dart';
import '../domain/repositories/country_repository.dart';
import '../domain/usecases/get_all_country_usecase.dart';

initCountryInjection() {
  di.registerSingleton<CountryDataSource>(CountryLocalDataSourceImpl());
  di.registerSingleton<CountryRepository>(CountryRepositoryImpl(countryDataSource: di.get()));
  di.registerSingleton<GetAllCountryUsecase>(GetAllCountryUsecase(countryRepository: di.get()));
}
