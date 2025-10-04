import 'package:car_rental/features/auth/domain/entities/request_password_reset_code_entity.dart';

class RequestPasswordResetCodeModel extends RequestPasswordResetCodeEntity {
  RequestPasswordResetCodeModel({
    required super.message,
    required super.code,
    required super.verifyToken,
  });

  factory RequestPasswordResetCodeModel.fromJson(Map<String, dynamic> json) {
    return RequestPasswordResetCodeModel(
      message: json['message'],
      code: json['code'],
      verifyToken: json['reset_token'],
    );
  }
}
