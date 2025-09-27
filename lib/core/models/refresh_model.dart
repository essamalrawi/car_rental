import 'package:car_rental/core/entites/refresh_entite.dart';

class RefreshTokenModel extends RefreshTokenEntity {
  const RefreshTokenModel({required super.access, required super.refresh});

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) {
    return RefreshTokenModel(access: json["access"], refresh: json["refresh"]);
  }

  Map<String, dynamic> toJson() {
    return {"access": access, "refresh": refresh};
  }
}
