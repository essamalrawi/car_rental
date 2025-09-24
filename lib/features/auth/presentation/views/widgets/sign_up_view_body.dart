import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/core/widgets/password_field.dart';
import 'package:car_rental/features/auth/presentation/manager/cubits/sign_up/sign_up_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/location_search_bar_suggetions.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/country_search_bar_suggestions.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/yes_no_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/or_divider.dart';
import '../../../../../core/widgets/social_login_button.dart';
import '../../../../../generated/assets.dart';
import 'have_an_account.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late String fullName, email, password, phone;
  late int countryId, locationId;
  bool createCar = false;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              autovalidateMode: autoValidateMode,
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
                  CustomTextFormField(
                    onSaved: (value) {
                      fullName = value!;
                    },
                    hintText: "Full Name",
                    textInputType: TextInputType.text,
                    obscureText: false,
                  ),
                  const SizedBox(height: 18),
                  CustomTextFormField(
                    hintText: "Email Address",
                    onSaved: (value) {
                      email = value!;
                    },
                    textInputType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                  const SizedBox(height: 18),
                  CustomTextFormField(
                    onSaved: (value) {
                      phone = value!;
                    },
                    hintText: "Phone number",
                    textInputType: TextInputType.number,
                    obscureText: false,
                  ),
                  const SizedBox(height: 18),
                  PasswordField(
                    onSaved: (value) {
                      password = value!;
                    },
                  ),

                  const SizedBox(height: 18),
                  CountrySearchBarSuggestions(
                    onSaved: (value) {
                      countryId = value!;
                    },
                  ),

                  const SizedBox(height: 18),
                  LocationSearchBarSuggetions(
                    onSaved: (value) {
                      locationId = value!;
                    },
                  ),

                  const SizedBox(height: 28),
                  YesNoChoice(
                    question: "Available to create a car?",
                    yesLabel: "Yes",
                    noLabel: "No",
                    yesIcon: Icons.check,
                    noIcon: Icons.close,
                    initialValue: 0,
                    onChanged: (c) {
                      createCar = c == 1;
                    },
                    enabled: true,
                    yesColor: const Color(0xFF21292B),
                    noColor: const Color(0xFF21292B),
                    selectedTextColor: const Color(0xFFEDEDED),
                    unselectedTextColor: const Color(0xFF21292B),
                    disabledColor: Colors.grey,
                  ),
                  const SizedBox(height: 28),
                  CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<SignUpCubit>().signUp(
                          fullName: fullName,
                          email: email,
                          password: password,
                          countryId: countryId,
                          phone: phone,
                          createCar: createCar,
                          locationId: locationId,
                        );
                      } else {
                        setState(() {
                          autoValidateMode = AutovalidateMode.always;
                        });
                      } // Navigator.pushNamed(
                      //   context,
                      //   VerifyYourPhoneNumberView.routeName,
                      // );
                    },
                    text: "Sign Up",
                  ),
                  const SizedBox(height: 18),
                  CustomButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    fontColor: const Color(0xFF21292B),
                    backgroundColor: const Color(0xFFEDEDED),
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
        ),
      ],
    );
  }
}
