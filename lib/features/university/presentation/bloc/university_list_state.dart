import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/config/constants.dart';
import 'package:flutter_clean_architecture/features/university/domain/entities/university.dart';

class UniversityListState extends Equatable {
  const UniversityListState({
    this.status = Status.initial,
    this.universities = const <University>[],
    this.keyword,
    this.country,
    this.offset = 0,
    this.limit = 0,
    this.isActiveSearch = false,
    this.errorCode = 0,
    this.errorMessage = "",
  });

  final Status status;
  final List<University> universities;
  final String? keyword;
  final String? country;
  final int offset;
  final int limit;
  final bool isActiveSearch;
  final String errorMessage;
  final int errorCode;
  
  @override
  List<Object?> get props => [status, universities, isActiveSearch, errorMessage, offset ];

  UniversityListState copyWith({
    status,
    universities,
    keyword,
    country,
    offset,
    limit,
    isActiveSearch,
    errorCode,
    errorMessage,
  }){
    return UniversityListState(
      status : status ?? this.status,
      universities: universities ?? this.universities,
      keyword: keyword ?? this.keyword,
      country: country ?? this.country,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      isActiveSearch: isActiveSearch ?? this.isActiveSearch,
      errorCode: errorCode ?? this.errorCode,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }
}
