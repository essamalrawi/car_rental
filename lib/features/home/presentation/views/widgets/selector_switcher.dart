import 'package:car_rental/features/home/presentation/views/widgets/active_selector.dart';
import 'package:car_rental/features/home/presentation/views/widgets/unactive_selector.dart';
import 'package:flutter/material.dart';

class SelectorSwitcher extends StatelessWidget {
  const SelectorSwitcher({
    super.key,
    required this.image,
    required this.text,
    required this.isActive,
  });
  final String image, text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveSelector(image: image, text: text)
        : UnActiveSelector(image: image, text: text);
  }
}
