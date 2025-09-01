import 'package:car_rental/features/auth/presentation/views/widgets/verify_your_phone_number_view_body.dart';
import 'package:flutter/material.dart';

class VerifyYourPhoneNumberView extends StatelessWidget {
  const VerifyYourPhoneNumberView({super.key});

  static const routeName = 'verify_number';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: VerifyYourPhoneNumberViewBody()),
    );
  }
}
