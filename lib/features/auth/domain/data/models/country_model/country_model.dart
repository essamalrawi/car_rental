import 'package:car_rental/features/auth/domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  CountryModel({
    required super.id,
    required super.country,
    required super.abbreviation,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'] as int,
      country: json['country'] as String,
      abbreviation: json['abbreviation'] as String,
    );
  }
}
