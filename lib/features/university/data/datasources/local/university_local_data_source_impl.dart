


import '../../../../../core/network/api_response.dart';
import '../../../domain/entities/university.dart';
import '../university_data_source.dart';

class UniversityLocalDataSourceImpl extends UniversityDataSource {
  @override
  Future<ApiResponse<List<University>>> search(String? keyword, String? country, int? offset, int? limit) async {
    List<University> universities = [];
    universities.add(University(name: "name1", stateProvince: "state", country: "Angola", countryCode: "CC", webPages: [], domains: []));
    universities.add(University(name: "name2", stateProvince: "state", country: "Angola", countryCode: "CC", webPages: [], domains: []));
    return ApiResponse.success(universities);
  }

}
