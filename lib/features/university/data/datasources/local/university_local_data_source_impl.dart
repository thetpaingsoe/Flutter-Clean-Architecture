


import '../../../domain/entities/university.dart';
import '../university_data_source.dart';

class UniversityLocalDataSourceImpl extends UniversityDataSource {
  @override
  Future<List<University>> search(String keyword, String country, int offset, int limit) async {
    List<University> universities = [];
    universities.add(University(name: "name1", stateProvince: "state", country: "Country", countryCode: "CC", webPages: [], domains: []));
    universities.add(University(name: "name2", stateProvince: "state", country: "Country", countryCode: "CC", webPages: [], domains: []));
    return universities;
  }

}
