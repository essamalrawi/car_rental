import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.backgroundColor,
    this.fontColor,
  });

  final void Function()? onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 62,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0xFF21292B), // border color
              width: 1, // border width
            ),
            borderRadius: BorderRadius.circular(62),
          ),
          backgroundColor: backgroundColor ?? const Color(0xFF21292B),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.bold18.copyWith(color: fontColor ?? Colors.white),
        ),
      ),
    );
  }
}
