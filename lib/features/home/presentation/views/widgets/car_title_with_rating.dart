import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarTitleWithRating extends StatelessWidget {
  const CarTitleWithRating({
    super.key,
    required this.name,
    required this.description,
    required this.rate,
    required this.reviewsCount,
  });
  final String name, description;
  final double rate;
  final int reviewsCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyles.semibold30.copyWith(fontSize: 16)),
              const SizedBox(height: 18),

              Text(
                description,
                style: TextStyles.regular14.copyWith(
                  color: const Color(0xFF7F7F7F),
                ),
              ),
            ],
          ),
        ),

        Column(
          children: [
            Row(
              children: [
                Text(
                  rate.toString(),
                  style: TextStyles.bold18.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                    height: 1.21,
                    letterSpacing: 0.14,
                  ),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset(Assets.imagesIconStar),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                '($reviewsCount+Reviews)',
                style: TextStyles.regular14.copyWith(
                  color: const Color(0xFF7F7F7F),
                  fontSize: 12,
                  height: 1.17,
                  letterSpacing: 0.12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
