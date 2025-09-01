import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/assets.dart';

class VerifyYourPhoneNumberViewBody extends StatelessWidget {
  const VerifyYourPhoneNumberViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        SvgPicture.asset(Assets.imagesAuthViewLogo),
      ],
    );
  }
}
