class CountryEntity {
  final int id;
  final String country;
  final String abbreviation;

  CountryEntity({
    required this.id,
    required this.country,
    required this.abbreviation,
  });

  factory CountryEntity.fromJson(Map<String, dynamic> json) {
    return CountryEntity(
      id: json['id'] as int,
      country: json['country'] as String,
      abbreviation: json['abbreviation'] as String,
    );
  }
}
