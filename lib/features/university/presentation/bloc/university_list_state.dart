
import 'package:flutter_clean_architecture/features/university/domain/entities/university.dart';

sealed class UniversityListState {
  final List<University> universities;

  const UniversityListState({required this.universities});
}

class UniversityListInitialState extends UniversityListState{
  const UniversityListInitialState({required super.universities});
}