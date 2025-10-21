import 'package:flutter/material.dart';

class SectionHeaderRow extends StatelessWidget {
  const SectionHeaderRow({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Recommend For You',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          'View All',
          style: TextStyle(
            color: Color(0xFF7F7F7F),
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
