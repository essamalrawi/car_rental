import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/or_divider.dart';
import '../../../../../core/widgets/social_login_button.dart';
import '../../../../../generated/assets.dart';
import 'have_an_account.dart';

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
                const SizedBox(height: 28),
                CustomButton(onPressed: () {}, text: "Sign Up"),
                const SizedBox(height: 18),
                const CustomButton(
                  fontColor: Color(0xFF21292B),
                  backgroundColor: Color(0xFFEDEDED),
                  text: "Login",
                ),
                const SizedBox(height: 28),
                const OrDivider(),
                const SizedBox(height: 28),
                const SocialLoginButton(
                  text: "Apple pay",
                  imagePath: Assets.imagesAppleLogo,
                ),
                const SizedBox(height: 18),
                const SocialLoginButton(
                  text: "Google pay",
                  imagePath: Assets.imagesGoogleLogo,
                ),
                const SizedBox(height: 57),
                const HaveAnAccount(),
                const SizedBox(height: 57),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
