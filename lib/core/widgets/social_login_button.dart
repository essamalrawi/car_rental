import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.imagePath,
  });

  final void Function()? onPressed;
  final String text;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 49,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0XFFD7D7D7), // border color
              width: 1, // border width
            ),
            borderRadius: BorderRadius.circular(62),
          ),
          backgroundColor: const Color(0XFFededed),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyles.semibold30.copyWith().copyWith(
                color: Colors.black,
                fontSize: 14,
                height: 1.17,
                letterSpacing: 0.14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
