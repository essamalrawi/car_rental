import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/widgets/custom_check_box.dart';
import '../utils/app_text_styles.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChecked: (value) {
            isTermsAccepted = value;
            setState(() {});
          },
        ),
        const SizedBox(width: 10),
        Text(
          'Remember Me',

          style: TextStyles.regular14.copyWith(
            letterSpacing: -0.14,
            color: const Color(0xFF7F7F7F),
          ),
        ),
        const Spacer(),
        Text(
          'Forgot Password',
          style: TextStyles.regular14.copyWith(
            color: const Color(0xFF454545),
            letterSpacing: -0.14,
          ),
        ),
      ],
    );
  }
}
