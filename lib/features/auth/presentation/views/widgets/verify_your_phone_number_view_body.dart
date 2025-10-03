import 'package:car_rental/constants.dart';
import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/core/services/shared_preferences_singleton.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/custom_text_form_field.dart';
import 'package:car_rental/features/auth/presentation/manager/cubits/verify_phone_number/verify_phone_number_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/country_search_bar_suggestions.dart';
import 'package:car_rental/features/on_boarding/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_text_styles.dart';

class VerifyYourPhoneNumberViewBody extends StatefulWidget {
  const VerifyYourPhoneNumberViewBody({super.key});

  @override
  State<VerifyYourPhoneNumberViewBody> createState() =>
      _VerifyYourPhoneNumberViewBodyState();
}

class _VerifyYourPhoneNumberViewBodyState
    extends State<VerifyYourPhoneNumberViewBody> {
  late String phone;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
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
                Row(
                  children: [
                    SvgPicture.asset(Assets.imagesIconAuthViewLogo),
                    const Spacer(),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          MainView.routeName,
                        );
                      },

                      child: Text(
                        "Skip",
                        style: TextStyles.regular14.copyWith(
                          color: const Color(0xFF232323),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Form(
              key: formKey,
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

                  CountrySearchBarSuggestions(onSaved: (value) {}),
                  const SizedBox(height: 18),
                  CustomTextFormField(
                    onSaved: (value) {
                      phone = value!;
                    },
                    hintText: "Phone number",
                    textInputType: TextInputType.number,
                    obscureText: false,
                  ),
                  const SizedBox(height: 28),
                  CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        String accesToken = Prefs.getString(kAccessToken);

                        context
                            .read<VerifyPhoneNumberCubit>()
                            .requestVerifyPhoneNumber(
                              phone: phone,
                              accessToken: accesToken,
                            );
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                      }
                    },
                    text: "Continue",
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
