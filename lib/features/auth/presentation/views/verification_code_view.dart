import 'package:car_rental/features/auth/presentation/views/widgets/verification_code_view_body.dart';
import 'package:flutter/material.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

  static const routeName = "verification_code";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: VerificationCodeViewBody()));
  }
}
