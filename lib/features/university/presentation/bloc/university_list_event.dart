sealed class UniversityListEvent {}

class UniversityListSearchEvent extends UniversityListEvent {
  String keyword;
  String country;
  int? offset;
  int? limit;
  UniversityListSearchEvent({required this.keyword, required this.country, this.offset, this.limit}) : super();
}