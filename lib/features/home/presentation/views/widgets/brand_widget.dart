import 'package:flutter/material.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({super.key, required this.brandName, required this.image});
  final String brandName;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,

          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image)),
          ),
        ),
        const SizedBox(height: 16),
        Text(brandName),
      ],
    );
  }
}
