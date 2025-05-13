import 'package:flutter/material.dart';

import '../../../../core/di/injections.dart';
import '../../domain/usecases/search_universities_usecase.dart';

/// --------------------------------------------------------------
/// Page
/// --------------------------------------------------------------
class UniversityListPage extends StatelessWidget {
  const UniversityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: UniversityListScreen()
      );
  }
}

/// --------------------------------------------------------------
/// Screen
/// --------------------------------------------------------------
class UniversityListScreen extends StatelessWidget {
  const UniversityListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
          child: TextButton(onPressed: () async {
            var data = await di<SearchUniversitiesUsercase>().call('','', 0, 10);
            for(var d in data){
              // ignore: avoid_print
              print(d.name);
            }
            
          }, child: Text("Load University Data.")),
        );
  }
}