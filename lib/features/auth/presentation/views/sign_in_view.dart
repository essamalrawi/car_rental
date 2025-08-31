import 'package:car_rental/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = "sign_in";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SignInViewBody()));
  }
}
