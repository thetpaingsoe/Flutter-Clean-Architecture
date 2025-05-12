


import '../../domain/entities/university.dart';

class UniversityModel extends University{

  UniversityModel({
    required super.name,
    required super.stateProvince,
    required super.country,
    required super.countryCode,
    required super.webPages,
    required super.domains
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      name: json['name'], 
      stateProvince: json['state-province'], 
      country: json['country'], 
      countryCode: json['alpha_two_code'], 
      webPages: json['web_pages'], 
      domains: json['domains']);
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'state-province': stateProvince,
    'country': country,
    'alpha_two_code': countryCode,
    'web_pages': webPages,
    'domains': domains
  };
}