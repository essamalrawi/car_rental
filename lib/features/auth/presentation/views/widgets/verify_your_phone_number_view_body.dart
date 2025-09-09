import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/features/auth/presentation/views/verification_code_view.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/country_drop_down_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/assets.dart';
import 'custom_pick_country.dart';

class VerifyYourPhoneNumberViewBody extends StatelessWidget {
  const VerifyYourPhoneNumberViewBody({super.key});

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
              ],
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                const Spacer(),
                Text(
                  'Verify your phone number',
                  textAlign: TextAlign.center,
                  style: TextStyles.semibold30.copyWith(
                    color: const Color(0xFF232323),
                  ),
                ),
                const SizedBox(height: 16),

                Text(
                  'We have sent you an SMS with a code to number',
                  style: TextStyles.regular14.copyWith(
                    color: const Color(0xFF7F7F7F),
                  ),
                ),
                const SizedBox(height: 40),

                const CustomPickCountry(showCode: true),
                const SizedBox(height: 18),
                const CustomTextFormField(
                  hintText: "Phone number",
                  textInputType: TextInputType.number,
                  obscureText: false,
                ),
                const SizedBox(height: 28),
                CustomButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      VerificationCodeView.routeName,
                    );
                  },
                  text: "Continue",
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
