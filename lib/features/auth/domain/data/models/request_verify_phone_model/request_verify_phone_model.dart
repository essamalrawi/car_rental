import 'package:car_rental/features/auth/domain/entities/request_verify_phone_entity.dart';

class RequestVerifyPhoneModel extends RequestVeifyPhoneEntity {
  RequestVerifyPhoneModel({
    required super.message,
    required super.code,
    required super.verifyToken,
  });

  factory RequestVerifyPhoneModel.fromJson(Map<String, dynamic> json) {
    return RequestVerifyPhoneModel(
      message: json['message'],
      code: json['code'],
      verifyToken: json['verify_token'],
    );
  }
}
