import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/assets.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                SvgPicture.asset(Assets.imagesAuthViewLogo),
                const SizedBox(height: 50),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Sign Up', style: TextStyles.semibold30)],
                ),
                const SizedBox(height: 40),
                const CustomTextFormField(
                  hintText: "Full Name",
                  textInputType: TextInputType.text,
                  obscureText: false,
                ),
                const SizedBox(height: 18),
                const CustomTextFormField(
                  hintText: "Email Address",
                  textInputType: TextInputType.emailAddress,
                  obscureText: false,
                ),
                const SizedBox(height: 18),
                const PasswordField(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
