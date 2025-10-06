import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:car_rental/features/home/presentation/views/widgets/custom_car_details_button.dart';
import 'package:car_rental/features/home/presentation/views/widgets/review_card.dart';
import 'package:flutter/material.dart';

class CarReviews extends StatelessWidget {
  const CarReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Review (125)',
              style: TextStyles.regular16.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),

            Text(
              'See All',
              style: TextStyles.regular14.copyWith(
                color: const Color(0xFF7F7F7F),
                height: 1.14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(right: 18.0),
                child: ReviewCard(),
              );
            },
          ),
        ),
        const SizedBox(height: 28),
        const CustomCarDetailsButton(),
        const SizedBox(height: 28),
      ],
    );
  }
}
