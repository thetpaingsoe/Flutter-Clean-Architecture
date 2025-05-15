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

// Handling Toggle Searchbar Event
class ActiveToggleSearchOnAppBarEvent extends UniversityListEvent {
  bool isActive;
  ActiveToggleSearchOnAppBarEvent({required this.isActive}) : super();
}

// Reset Data Event
class ResetDataEvent extends UniversityListEvent {
  String? country;
  ResetDataEvent({String? country}): super();
}