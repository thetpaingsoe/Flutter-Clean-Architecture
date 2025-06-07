import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/config/constants.dart';
import 'package:flutter_clean_architecture/features/country/domain/entities/country.dart';
import 'package:flutter_clean_architecture/features/university/domain/entities/params/search_university_params.dart';
import 'package:flutter_clean_architecture/features/university/domain/entities/university.dart';

class UniversityListState extends Equatable {
  const UniversityListState({
    this.status = Status.initial,
    this.universities = const <University>[],
    this.countries = const <Country>[],
    this.params = const SearchUniversityParams(),
    this.isActiveSearch = false,
    this.errorCode = 0,
    this.errorMessage = "",
    this.selectedCountryIndex = 0,
  });

  final Status status;
  final List<University> universities;
  final List<Country> countries;
  final SearchUniversityParams params;
  final bool isActiveSearch;
  final String errorMessage;
  final int errorCode;
  final int selectedCountryIndex;

  @override
  List<Object?> get props => [
    status,
    universities,
    isActiveSearch,
    errorMessage,
    params.country,
    params.offset,
  ];

  UniversityListState copyWith({
    status,
    universities,
    countries,
    params,
    isActiveSearch,
    errorCode,
    errorMessage,
    selectedCountryIndex,
  }) {
    return UniversityListState(
      status: status ?? this.status,
      universities: universities ?? this.universities,
      countries: countries ?? this.countries,
      params: params ?? this.params,
      isActiveSearch: isActiveSearch ?? this.isActiveSearch,
      errorCode: errorCode ?? this.errorCode,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedCountryIndex: selectedCountryIndex ?? this.selectedCountryIndex,
    );
  }
}
