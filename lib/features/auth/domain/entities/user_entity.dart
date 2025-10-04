import 'package:car_rental/features/auth/domain/data/models/user_model/user_model.dart';

class UserEntity {
  final User user;
  final String? message;
  final Tokens tokens;

  UserEntity({required this.user, required this.message, required this.tokens});
}
