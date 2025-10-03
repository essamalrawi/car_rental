import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class BestCarsSection extends StatelessWidget {
  const BestCarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Best Cars",
                  style: TextStyles.semibold30.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 18),
                Text(
                  "Available",
                  style: TextStyles.regular14.copyWith(
                    color: const Color(0xff7F7F7F),
                  ),
                ),
              ],
            ),
            Text(
              "View All",
              style: TextStyles.regular14.copyWith(
                fontSize: 12,
                color: const Color(0xff7F7F7F),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
