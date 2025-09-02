import 'package:flutter/material.dart';

import 'CustomOtpTextFormField.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomOtpTextFormField(),
          CustomOtpTextFormField(),
          CustomOtpTextFormField(),
          CustomOtpTextFormField(),
        ],
      ),
    );
  }
}
