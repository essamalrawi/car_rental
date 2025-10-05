import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: BoxBorder.all(width: 1, color: const Color(0xffD7D7D7)),
              ),
              child: Center(child: SvgPicture.asset(Assets.imagesIconArrow)),
            ),
          ),
          const Spacer(),

          const Text('Car Details', style: TextStyles.bold18),

          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: BoxBorder.all(width: 1, color: const Color(0xffD7D7D7)),
              ),
              child: Center(child: SvgPicture.asset(Assets.imagesIconDots)),
            ),
          ),
        ],
      ),
    );
  }
}
