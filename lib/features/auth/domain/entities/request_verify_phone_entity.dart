class RequestVeifyPhoneEntity {
  final String message;
  final String code;
  final String verifyToken;

  RequestVeifyPhoneEntity({
    required this.message,
    required this.code,
    required this.verifyToken,
  });
}
