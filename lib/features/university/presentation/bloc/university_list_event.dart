sealed class UniversityListEvent {}

class UniversityListLoadDataEvent extends UniversityListEvent {  
  UniversityListLoadDataEvent();
}

class UniversityListLoadMoreDataEvent extends UniversityListEvent {  
  UniversityListLoadMoreDataEvent();
}

class UniversityListSearchEvent extends UniversityListEvent {
  String keyword;
  String country;
  UniversityListSearchEvent({required this.keyword, required this.country}) : super();
}