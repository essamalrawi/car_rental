import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Don't have an account?",
                style: TextStyles.regular14.copyWith(color: Color(0xFF7F7F7F)),
              ),
              TextSpan(
                text: " ",
                style: TextStyles.regular14.copyWith(color: Color(0xFF7F7F7F)),
              ),
              TextSpan(
                text: "Sign Up.",
                style: TextStyles.regular14.copyWith(color: Color(0xFF454545)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
