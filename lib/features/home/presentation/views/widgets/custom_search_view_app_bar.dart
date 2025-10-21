import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:car_rental/features/home/presentation/views/widgets/filter_search_widget.dart';
import 'package:flutter/material.dart';

class CustomSearchViewAppBar extends StatelessWidget {
  const CustomSearchViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const IconHolder(iconImage: Assets.imagesIconArrow),
        ),
        const Spacer(),
        const Text("Search", style: TextStyles.bold18),
        const Spacer(),
        const IconHolder(iconImage: Assets.imagesIconDots),
      ],
    );
  }
}
