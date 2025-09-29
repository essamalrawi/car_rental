import 'package:car_rental/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,

      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const ShapeDecoration(
            color: Color(0xFFF8F8F8),
            shape: OvalBorder(
              side: BorderSide(width: 1, color: Color(0xFFD7D7D7)),
            ),
          ),
          child: Center(child: SvgPicture.asset(Assets.imagesNotifications)),
        ),

        Positioned(
          top: -3,
          right: -3,
          child: Container(
            width: 18,
            decoration: const ShapeDecoration(
              color: Color(0xff454545),
              shape: OvalBorder(),
            ),
            height: 18,
            child: const Text(
              textAlign: TextAlign.center,
              '2',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
