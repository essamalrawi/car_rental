import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:car_rental/features/home/presentation/views/widgets/feature_container.dart';
import 'package:flutter/material.dart';

class Carfeatures extends StatelessWidget {
  const Carfeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Car features',
          style: TextStyles.regular16.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 18),

        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 100 / 100,
          children: List.generate(6, (index) {
            return const FeatureContainer(
              iconAsset: Assets.imagesIconChair,
              title: "Capacity",
              value: "5 Seats",
            );
          }),
        ),
      ],
    );
  }
}
