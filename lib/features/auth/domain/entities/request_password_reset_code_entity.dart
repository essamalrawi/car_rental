class RequestPasswordResetCodeEntity {
  final String message, code, verifyToken;

  RequestPasswordResetCodeEntity({
    required this.message,
    required this.code,
    required this.verifyToken,
  });
}
