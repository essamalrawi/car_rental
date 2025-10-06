import 'package:car_rental/constants/assets.dart';
import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const ShapeDecoration(
        shape: OvalBorder(side: BorderSide(width: 1, color: Color(0xFFD7D7D7))),
      ),
      child: Image.asset(Assets.imagesProfilePic),
    );
  }
}
