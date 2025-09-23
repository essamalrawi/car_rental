import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/features/auth/presentation/cubits/reset_password/reset_password_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/new_passwrod_view.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/otp_form.dart';
import 'package:car_rental/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyResetPasswordCodeViewBody extends StatefulWidget {
  const VerifyResetPasswordCodeViewBody({super.key});

  @override
  State<VerifyResetPasswordCodeViewBody> createState() =>
      _VerifyResetPasswordCodeViewBodyState();
}

class _VerifyResetPasswordCodeViewBodyState
    extends State<VerifyResetPasswordCodeViewBody> {
  late String correctCode = context
      .read<ResetPasswordCubit>()
      .requestPasswordResetCodeEntity
      .code;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [SvgPicture.asset(Assets.imagesAuthViewLogo)],
                ),
                const Spacer(),
                Text(
                  'Enter verification code',
                  textAlign: TextAlign.center,
                  style: TextStyles.semibold30.copyWith(
                    color: const Color(0xFF232323),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'We have sent a code to your phone',
                  style: TextStyles.regular14.copyWith(
                    color: const Color(0xFF7F7F7F),
                  ),
                ),
                const SizedBox(height: 40),
                const OtpForm(),
                const SizedBox(height: 24),
                CustomButton(
                  text: "Continue",
                  onPressed: () {
                    final userCode = context.read<ResetPasswordCubit>().code;
                    log(userCode);
                    if (correctCode == userCode) {
                      Navigator.pushReplacementNamed(
                        context,
                        NewPasswordView.routeName,
                        arguments: context.read<ResetPasswordCubit>(),
                      );
                    } else if (!(correctCode == userCode)) {
                      if (userCode.length > 3) {
                        Flushbar(
                          title: "Error",
                          message:
                              "The code you entered is incorrect. Please try again.",
                          duration: const Duration(seconds: 3),
                          backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                          icon: const Icon(Icons.error, color: Colors.white),
                          flushbarPosition: FlushbarPosition.TOP,
                        ).show(context);
                      } else {
                        Flushbar(
                          title: "Input Required",
                          message:
                              "Please fill in the required field before submitting.",
                          duration: const Duration(seconds: 10),
                          backgroundColor: const Color.fromARGB(
                            255,
                            255,
                            165,
                            0,
                          ),
                          icon: const Icon(Icons.warning, color: Colors.white),
                          flushbarPosition: FlushbarPosition.TOP,
                        ).show(context);
                      }

                      context.read<ResetPasswordCubit>().resetCode();
                    }
                  },
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
