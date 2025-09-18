class RequestPasswordResetCodeEntity {
  final String message, code, resetToken;

  RequestPasswordResetCodeEntity({
    required this.message,
    required this.code,
    required this.resetToken,
  });

  factory RequestPasswordResetCodeEntity.fromJson(Map<String, dynamic> json) {
    return RequestPasswordResetCodeEntity(
      message: json['message'],
      code: json['code'],
      resetToken: json['reset_token'],
    );
  }
}
