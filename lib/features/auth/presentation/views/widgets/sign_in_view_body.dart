import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/forgot_password.dart';
import '../../../../../core/widgets/or_divider.dart';
import '../../../../../core/widgets/password_field.dart';
import '../../../../../core/widgets/social_login_button.dart';
import '../../manager/cubits/sign_in/sign_in_cubit.dart';
import '../sign_up_view.dart';
import 'dont_have_an_account.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              key: _formKey,
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
                  CustomTextFormField(
                    obscureText: false,
                    hintText: 'Email/Phone Number',
                    textInputType: TextInputType.emailAddress,
                    onSaved: (value) {
                      email = value!;
                    },
                  ),
                  const SizedBox(height: 18),
                  PasswordField(
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                  const SizedBox(height: 28),
                  const ForgotPassword(),
                  const SizedBox(height: 28),
                  CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<SignInCubit>().signIn(
                          email: email,
                          password: password,
                        );
                      } else {
                        setState(() {
                          autoValidateMode = AutovalidateMode.always;
                        });
                      }
                    },

                    text: "Login",
                  ),
                  const SizedBox(height: 18),
                  CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpView.routeName);
                    },
                    fontColor: const Color(0xFF21292B),
                    backgroundColor: const Color(0xFFEDEDED),
                    text: "Sign up",
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
          ),
        ],
      ),
    );
  }
}
