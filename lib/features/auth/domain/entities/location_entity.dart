class LocationEntity {
  final int id;
  final String name;
  final double lat;
  final double lng;

  LocationEntity({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
  });

  factory LocationEntity.fromJson(Map<String, dynamic> json) {
    return LocationEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }
}
