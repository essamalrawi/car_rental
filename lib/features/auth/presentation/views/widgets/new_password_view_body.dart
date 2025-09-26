import 'dart:developer';

import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/password_field.dart';
import 'package:car_rental/features/auth/presentation/manager/cubits/reset_password/reset_password_cubit.dart';
import 'package:car_rental/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPasswordViewBody extends StatefulWidget {
  const NewPasswordViewBody({super.key});

  @override
  State<NewPasswordViewBody> createState() => _NewPasswordViewBodyState();
}

class _NewPasswordViewBodyState extends State<NewPasswordViewBody> {
  String password = "";
  String confirmPassword = "";
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [SvgPicture.asset(Assets.imagesAuthViewLogo)],
                  ),
                  const Spacer(),
                  Text(
                    'Enter new password',
                    textAlign: TextAlign.center,
                    style: TextStyles.semibold30.copyWith(
                      color: const Color(0xFF232323),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Please make sure both passwords match',
                    style: TextStyles.regular14.copyWith(
                      color: const Color(0xFF7F7F7F),
                    ),
                  ),
                  const SizedBox(height: 40),
                  PasswordField(
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                  const SizedBox(height: 18),
                  PasswordField(
                    onSaved: (value) {
                      confirmPassword = value!;
                    },
                    hintText: "Confirm password",
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    text: "Continue",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        if (password == confirmPassword) {
                          var data = context
                              .read<ResetPasswordCubit>()
                              .requestPasswordResetCodeEntity;

                          log(
                            "${data.code} ${data.verifyToken} $password $confirmPassword",
                          );

                          context
                              .read<ResetPasswordCubit>()
                              .resetPasswordResetCode(
                                resetToken: data.verifyToken,
                                code: data.code,
                                password: password,
                                confirmPassword: confirmPassword,
                              );
                        } else {
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      } else {
                        setState(() {
                          autoValidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
