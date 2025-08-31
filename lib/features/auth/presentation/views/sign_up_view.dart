import 'package:car_rental/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = "sign_up";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SignUpViewBody()));
  }
}
