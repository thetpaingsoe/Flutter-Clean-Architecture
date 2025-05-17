
import 'package:flutter_clean_architecture/features/country/domain/entities/country.dart';

class CountryModel extends Country {
  CountryModel({required super.name});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
  };
}