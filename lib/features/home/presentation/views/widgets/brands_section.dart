import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:car_rental/features/home/presentation/views/widgets/bran_widget.dart';
import 'package:flutter/material.dart';

class BrandsSection extends StatelessWidget {
  const BrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Brands", style: TextStyles.semibold30.copyWith(fontSize: 16)),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index) {
            return const BranWidget();
          }),
        ),
      ],
    );
  }
}
