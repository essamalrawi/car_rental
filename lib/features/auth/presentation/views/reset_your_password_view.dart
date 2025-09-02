import 'package:car_rental/features/auth/presentation/views/widgets/reset_your_password_view_body.dart';
import 'package:flutter/material.dart';

class ResetYourPasswordView extends StatelessWidget {
  const ResetYourPasswordView({super.key});

  static const routeName = "reset_password";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: ResetYourPasswordViewBody()));
  }
}
