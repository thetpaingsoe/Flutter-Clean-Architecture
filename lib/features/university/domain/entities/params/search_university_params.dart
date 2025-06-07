import '../../../../../core/config/config.dart';

class SearchUniversityParams {
  final String keyword;
  final String country;
  final int limit;
  final int offset;

  const SearchUniversityParams({
    String? keyword,
    String? country,
    int? limit,
    int? offset,
  }) : keyword = keyword ?? "",
       country = country ?? "",
       limit = limit ?? Config.limit,
       offset = offset ?? Config.offset;

  SearchUniversityParams copyWith({
    String? keyword,
    String? country,
    int? limit,
    int? offset,
  }) {
    return SearchUniversityParams(
      keyword: keyword ?? this.keyword,
      country: country ?? this.country,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
    );
  }
}
