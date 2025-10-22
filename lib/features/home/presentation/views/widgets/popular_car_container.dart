import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PopularCarContianer extends StatelessWidget {
  const PopularCarContianer({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 256 / 100,
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFFEDEDED),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFD7D7D7)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SizedBox(
                width: 118,
                child: AspectRatio(
                  aspectRatio: 118 / 67,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Image.asset(Assets.imagesTestCar),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      'Ferrari LaFerrari',
                      style: TextStyles.regular14.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '5.0',
                          style: TextStyles.semibold30.copyWith(
                            color: const Color(0xFF7F7F7F),
                            fontSize: 12,
                            height: 1.17,
                            letterSpacing: 0.12,
                          ),
                        ),
                        const SizedBox(width: 5),
                        SvgPicture.asset(Assets.imagesIconStar),
                      ],
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '\$100/Day',
                      style: TextStyles.regular14.copyWith(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
