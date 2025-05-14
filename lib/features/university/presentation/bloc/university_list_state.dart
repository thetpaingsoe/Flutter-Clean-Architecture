
import 'package:flutter_clean_architecture/features/university/domain/entities/university.dart';

sealed class UniversityListState {  
  const UniversityListState();
}

class UniversityListInitialState extends UniversityListState{
  const UniversityListInitialState(): super();
}

class UniversityListLoadingState extends UniversityListState{
  const UniversityListLoadingState() : super();
}

class UniversityListErrorState extends UniversityListState {
  final String errorMessage;
  const UniversityListErrorState({required this.errorMessage}) : super();
}

class UniversityListSuccessState extends UniversityListState {
  final List<University> universities;
  String? keyword; 
  String? country; 
  int offset = 0;
  int limit = 10;
  UniversityListSuccessState({required this.universities, this.keyword, this.country, this.offset = 0, this.limit = 10}): super();
}