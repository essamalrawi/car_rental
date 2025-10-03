import 'package:car_rental/constants/assets.dart';
import 'package:flutter/material.dart';

class NearbyCar extends StatelessWidget {
  const NearbyCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Nearby"), Text("View All")],
        ),
        const SizedBox(height: 18),
        Container(
          width: double.infinity,

          decoration: BoxDecoration(
            color: const Color(0xffF0F0F0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            height: 121,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.sizeOf(context).width * .1,
              ),
              child: Image.asset(Assets.imagesTestcar),
            ),
          ),
        ),
      ],
    );
  }
}
