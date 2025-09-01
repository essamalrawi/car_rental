import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "have an account?",
                style: TextStyles.regular14.copyWith(
                  color: const Color(0xFF7F7F7F),
                ),
              ),
              TextSpan(
                text: " ",
                style: TextStyles.regular14.copyWith(
                  color: const Color(0xFF7F7F7F),
                ),
              ),

              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(context);
                  },
                text: "Sign In.",
                style: TextStyles.regular14.copyWith(
                  color: const Color(0xFF454545),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
