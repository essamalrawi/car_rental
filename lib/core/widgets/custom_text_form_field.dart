import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.textInputType,
    required this.obscureText,
    this.onSaved,
  });

  final TextInputType textInputType;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      obscureText: obscureText,
      keyboardType: textInputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: TextStyles.regular14.copyWith(
          color: const Color(0xFF7F7F7F),
          letterSpacing: -0.14,
        ),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: 1, color: Color(0xFFD7D7D7)),
    );
  }
}
