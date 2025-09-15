import 'package:car_rental/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});

  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          // print(obscureText);
          setState(() {});
        },
        child: obscureText
            ? SizedBox(
                width: 20,
                height: 20,
                child: Center(
                  child: SvgPicture.asset(Assets.imagesShowPasswordIcon),
                ),
              )
            : const Icon(Icons.visibility_off, color: Color(0xffC9CECF)),
      ),
      hintText: 'Password',
      textInputType: TextInputType.visiblePassword,
    );
  }
}
