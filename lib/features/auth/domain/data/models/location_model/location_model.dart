import 'package:car_rental/features/auth/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    required super.id,
    required super.name,
    required super.lat,
    required super.lng,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'] as int,
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }
}
