class RequestVeifyPhoneEntity {
  final String message;
  final String code;
  final String verifyToken;

  RequestVeifyPhoneEntity({
    required this.message,
    required this.code,
    required this.verifyToken,
  });

  factory RequestVeifyPhoneEntity.fromJson(Map<String, dynamic> json) {
    return RequestVeifyPhoneEntity(
      message: json['message'],
      code: json['code'],
      verifyToken: json['verify_token'],
    );
  }
}
