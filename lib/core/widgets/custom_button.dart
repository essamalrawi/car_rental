import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 62,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(62),
          ),
          backgroundColor: Color(0xFF21292B),
        ),
        onPressed: () {},
        child: Text(
          "Get Started",
          style: TextStyles.bold18.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
