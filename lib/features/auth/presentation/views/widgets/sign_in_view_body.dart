import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/forgot_password.dart';
import '../../../../../core/widgets/or_divider.dart';
import '../../../../../core/widgets/password_field.dart';
import '../../../../../core/widgets/social_login_button.dart';
import 'dont_have_an_account.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                SvgPicture.asset(Assets.imagesAuthViewLogo),
                const SizedBox(height: 50),
                const Text(
                  'Welcome Back\nReady to hit the road.',
                  style: TextStyles.semibold30,
                ),
                const SizedBox(height: 40),
                const CustomTextFormField(
                  obscureText: false,
                  hintText: 'Email/Phone Number',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 18),
                const PasswordField(),
                const SizedBox(height: 28),
                const ForgotPassword(),
                const SizedBox(height: 28),
                const CustomButton(text: "Login"),
                const SizedBox(height: 18),
                const CustomButton(
                  fontColor: Color(0xFF21292B),
                  backgroundColor: Color(0xFFEDEDED),
                  text: "Sing up",
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
                const DontHaveAccount(),
                const SizedBox(height: 57),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
