import 'package:car_rental/core/models/auth_response_model.dart';

class UserEntity {
  final User user;
  final String? message;
  final Tokens tokens;

  UserEntity({required this.user, required this.message, required this.tokens});
}
