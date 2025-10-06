import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCarDetailsButton extends StatelessWidget {
  const CustomCarDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 62,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0xFF21292B), // border color
              width: 1, // border width
            ),
            borderRadius: BorderRadius.circular(62),
          ),
          backgroundColor: const Color(0xFF21292B),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Book Now",
              style: TextStyles.semibold30.copyWith(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(Assets.imagesIconRightArrow),
          ],
        ),
      ),
    );
  }
}
