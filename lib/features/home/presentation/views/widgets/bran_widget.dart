import 'package:flutter/material.dart';

class BranWidget extends StatelessWidget {
  const BranWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const ShapeDecoration(
            color: Color.fromARGB(255, 218, 198, 197),
            shape: OvalBorder(),
          ),
        ),
        const SizedBox(height: 16),
        const Text("Brand's name"),
      ],
    );
  }
}
