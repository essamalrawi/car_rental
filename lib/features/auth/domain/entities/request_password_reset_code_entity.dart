class RequestPasswordResetCodeEntity {
  final String message, code, verifyToken;

  RequestPasswordResetCodeEntity({
    required this.message,
    required this.code,
    required this.verifyToken,
  });

  factory RequestPasswordResetCodeEntity.fromJson(Map<String, dynamic> json) {
    return RequestPasswordResetCodeEntity(
      message: json['message'],
      code: json['code'],
      verifyToken: json['reset_token'],
    );
  }
}
