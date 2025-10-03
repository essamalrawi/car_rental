import 'package:car_rental/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterSearchWidget extends StatelessWidget {
  const FilterSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,

      decoration: const ShapeDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        shape: OvalBorder(side: BorderSide(width: 1, color: Color(0xFFD7D7D7))),
      ),
      child: Center(child: SvgPicture.asset(Assets.imagesIconFilterIcon)),
    );
  }
}
