import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/assets.dart';
import 'otp_form.dart';

class VerificationCodeViewBody extends StatelessWidget {
  const VerificationCodeViewBody({super.key});

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
                  'We have send a Code to : +100******00',
                  style: TextStyles.regular14.copyWith(
                    color: const Color(0xFF7F7F7F),
                  ),
                ),
                const SizedBox(height: 40),
                const OtpForm(),
                const SizedBox(height: 24),
                const CustomButton(text: "Continue"),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
