import '../../features/auth/domain/entities/user_entity.dart';

class AuthResponseModel {
  final User user;
  final String? message;
  final Tokens tokens;

  AuthResponseModel({
    required this.user,
    required this.message,
    required this.tokens,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      user: User.fromJson(json['user']),
      message: json['message'],
      tokens: Tokens.fromJson(json['tokens']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'message': message,
      'tokens': tokens.toJson(),
    };
  }

  UserEntity toEntity() {
    return UserEntity(user: user, message: message, tokens: tokens);
  }

  @override
  String toString() {
    return '''
  AuthResponse(
    user: $user,
    message: $message,
    tokens: $tokens
  )''';
  }
}

class User {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final bool phoneVerified;
  final Country country;
  final Location location;
  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.phoneVerified,
    required this.country,
    required this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      phone: json['phone'],
      phoneVerified: json['phone_is_verified'],
      country: Country.fromJson(json['country']),
      location: Location.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      "country": country.toJson(),
      "location": location.toJson(),
    };
  }
}

class Country {
  final int id;
  final String country;
  final String abbreviation;

  Country({
    required this.id,
    required this.country,
    required this.abbreviation,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      country: json['country'],
      abbreviation: json['abbreviation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'country': country, 'abbreviation': abbreviation};
  }
}

class Location {
  final int id;
  final String name;
  final double lat;
  final double lng;

  Location({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] as int,
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'lat': lat, "lng": lng};
  }
}

class Tokens {
  final String access;
  final String refresh;

  Tokens({required this.access, required this.refresh});

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(access: json['access'], refresh: json['refresh']);
  }

  Map<String, dynamic> toJson() {
    return {'access': access, 'refresh': refresh};
  }
}
