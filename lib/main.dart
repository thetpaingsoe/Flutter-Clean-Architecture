import 'package:flutter/material.dart';

import 'features/university/data/datasources/local/university_local_data_source_impl.dart';
import 'features/university/data/repositories/university_repository_impl.dart';
import 'features/university/domain/entities/university.dart';
import 'features/university/domain/usecases/search_universities.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<List<University>> loadData() async {
    final source = UniversityLocalDataSourceImpl();
    final repo = UniversityRepositoryImpl(universityRemoteDataSource: source);
    final data = await SearchUniversities(universityRepository: repo).call('','', 0, 10);
    
    return data;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  {
    
    // loadData();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Center(
          child: TextButton(onPressed: () async {
            var data = await loadData();
            for(var d in data){
              print(d.name);
            }
            
          }, child: Text("load me")),
        )
      )
      
    );
  }
}
