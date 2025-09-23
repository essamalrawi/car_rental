class RequestVeifyPhoneEntity {
  final String message;
  final String phone;
  final String verifyToken;

  RequestVeifyPhoneEntity({
    required this.message,
    required this.phone,
    required this.verifyToken,
  });

  factory RequestVeifyPhoneEntity.fromJson(Map<String, dynamic> json) {
    return RequestVeifyPhoneEntity(
      message: json['message'],
      phone: json['phone'],
      verifyToken: json['verify_token'],
    );
  }
}
