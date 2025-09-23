import 'package:car_rental/features/auth/presentation/views/widgets/new_password_body_bloc_consumer.dart';
import 'package:flutter/material.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});
  static const routeName = "new_password";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: NewPasswordBodyBlocConsumer());
  }
}
