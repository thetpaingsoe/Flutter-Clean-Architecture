import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../../core/network/api_response.dart';
import '../../../domain/entities/university.dart';
import '../../models/university_model.dart';
import '../university_data_source.dart';

class UniversityLocalDataSourceImpl extends UniversityDataSource {
  @override
  Future<ApiResponse<List<University>>> search(
    String? keyword,
    String? country,
    int? offset,
    int? limit,
  ) async {
    // Credit :
    // Original Universities Data Source :
    // https://github.com/Hipo/university-domains-list/blob/master/world_universities_and_domains.json
    try {
      String jsonString = await rootBundle.loadString('assets/world_universities_and_domains.json');
      List<dynamic> jsonData = jsonDecode(jsonString);

      final data =
          (jsonData)
              .map((e) => UniversityModel.fromJson(e))
              .whereType<University>()
              .toList()
              // apply filters
              .where(
                (university) =>
                    (keyword == null ||
                        keyword.isEmpty ||
                        university.name.toLowerCase().contains(
                          keyword.toLowerCase(),
                        )) &&
                    (country == null ||
                        country.isEmpty ||
                        university.country.toLowerCase() ==
                            country.toLowerCase()),
              )
              .take(limit ?? 10)
              .skip(offset ?? 0)
              .toList();
      return ApiResponse.success(data, statusCode: 200);
    } catch (e) {
      return ApiResponse.error(e.toString(), statusCode: 500);
    }
   
  }
}
