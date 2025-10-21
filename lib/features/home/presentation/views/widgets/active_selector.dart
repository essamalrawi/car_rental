import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ActiveSelector extends StatelessWidget {
  const ActiveSelector({super.key, required this.image, required this.text});
  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xff21292B),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(60),
            ),
            child: Center(child: Image.asset(image)),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyles.semibold30.copyWith(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
