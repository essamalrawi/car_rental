import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeatureContainer extends StatelessWidget {
  const FeatureContainer({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.value,
  });
  final String iconAsset; // path to the icon
  final String title; // e.g., "Capacity"
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 117,
      height: 117,
      decoration: BoxDecoration(
        color: const Color(0xffEDEDED),

        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(child: SvgPicture.asset(iconAsset)),
            ),
            const SizedBox(height: 18),
            Text(
              title,
              style: TextStyles.semibold30.copyWith(
                color: const Color(0xFF7F7F7F),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: TextStyles.regular14.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
