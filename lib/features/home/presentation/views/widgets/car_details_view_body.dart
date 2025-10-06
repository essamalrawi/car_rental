import 'package:car_rental/features/home/presentation/views/widgets/car_details_slider.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_features.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_reviews.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_selectiong_container.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_title_with_rating.dart';
import 'package:car_rental/features/home/presentation/views/widgets/contact_car_row.dart';
import 'package:car_rental/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CarDetailsViewBody extends StatelessWidget {
  const CarDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomAppBar(),
              ),
              SizedBox(height: 20),
              Divider(color: Color(0xFFD9D9D9)),
              SizedBox(height: 20),
              CarDetailsSlider(),
              SizedBox(height: 28),
              CarInfoContainer(
                widget: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 20),
                      CarTitleWithRating(),
                      SizedBox(height: 28),
                      Divider(color: Color(0xFFD9D9D9)),
                      SizedBox(height: 28),
                      ContactCardRow(),
                      SizedBox(height: 28),
                      Carfeatures(),
                      SizedBox(height: 28),
                      CarReviews(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(color: Colors.white),
        ),
      ],
    );
  }
}
