
import '../../core/config/config.dart';
import '../../core/config/constants.dart';
import '../../core/di/injections.dart';
import 'data/datasources/local/university_local_data_source_impl.dart';
import 'data/datasources/remote/university_remote_data_source_impl.dart';
import 'data/datasources/university_data_source.dart';
import 'data/repositories/university_repository_impl.dart';
import 'domain/repositories/university_repository.dart';
import 'domain/usecases/search_universities_usecase.dart';

initUniversityInjection() {

  // Init DataSouce Based on the DataScoure Config
  if(Config.dataSource == DataSource.remote) {
    di.registerSingleton<UniversityDataSource>(UniversityRemoteDataSourceImpl(dioClient: di.get() ));
  }else {
    di.registerSingleton<UniversityDataSource>(UniversityLocalDataSourceImpl());
  }
  
  // Init Repo and UseCases
  di.registerSingleton<UniversityRepository>(UniversityRepositoryImpl(universityRemoteDataSource: di.get()));
  di.registerSingleton<SearchUniversitiesUsercase>(SearchUniversitiesUsercase(universityRepository: di.get()));  
}