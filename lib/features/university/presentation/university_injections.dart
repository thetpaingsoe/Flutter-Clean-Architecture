
import 'package:flutter_clean_architecture/core/di/injections.dart';
import 'package:flutter_clean_architecture/features/university/domain/repositories/university_repository.dart';


import '../data/datasources/remote/university_remote_data_source_impl.dart';
import '../data/datasources/university_data_source.dart';
import '../data/repositories/university_repository_impl.dart';
import '../domain/usecases/search_universities_usecase.dart';

initUniversityInjection() {
  di.registerSingleton<UniversityDataSource>(UniversityRemoteDataSourceImpl(dioClient: di.get() ));
  di.registerSingleton<UniversityRepository>(UniversityRepositoryImpl(universityRemoteDataSource: di.get()));
  di.registerSingleton<SearchUniversitiesUsercase>(SearchUniversitiesUsercase(universityRepository: di.get()));  
}