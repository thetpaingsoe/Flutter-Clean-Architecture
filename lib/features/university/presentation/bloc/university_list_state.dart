
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
  final int errorCode;
  const UniversityListErrorState({required this.errorCode, required this.errorMessage}) : super();
}

class UniversityListSuccessState extends UniversityListState {
  final List<University> universities;
  String? keyword; 
  String? country; 
  int offset;
  int limit;
  UniversityListSuccessState({required this.universities, this.keyword, this.country, this.offset = 0, this.limit = 10}): super();

  UniversityListSuccessState copyWith({List<University>? universities, String? keyword, String? country, int? offset, int? limit}) {
    return UniversityListSuccessState(
      universities: universities ?? this.universities,
      keyword: keyword ?? this.keyword,
      country: country ?? this.country,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit
    );
  }
}