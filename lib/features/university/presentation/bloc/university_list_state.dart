import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/config/constants.dart';
import 'package:flutter_clean_architecture/features/university/domain/entities/params/search_university_params.dart';
import 'package:flutter_clean_architecture/features/university/domain/entities/university.dart';

class UniversityListState extends Equatable {
  const UniversityListState({
    this.status = Status.initial,
    this.universities = const <University>[],
    this.params = const SearchUniversityParams(),
    this.isActiveSearch = false,
    this.errorCode = 0,
    this.errorMessage = "",
  });

  final Status status;
  final List<University> universities;  
  final SearchUniversityParams params;
  final bool isActiveSearch;
  final String errorMessage;
  final int errorCode;
  
  @override
  List<Object?> get props => [status, universities, isActiveSearch, errorMessage, params.offset ];

  UniversityListState copyWith({
    status,
    universities,    
    params,
    isActiveSearch,
    errorCode,
    errorMessage,
  }){
    return UniversityListState(
      status : status ?? this.status,
      universities: universities ?? this.universities,      
      params: params ?? this.params,
      isActiveSearch: isActiveSearch ?? this.isActiveSearch,
      errorCode: errorCode ?? this.errorCode,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }
}
