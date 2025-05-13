import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/university/presentation/pages/university_list_page.dart';

import 'core/di/injections.dart';

void main() async {
  // Init Injections
  await initInjections();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: UniversityListPage(),
    );
  }
}
