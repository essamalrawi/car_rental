import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/presentation/manager/get_one_car/get_one_car_cubit.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_details_slider.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_features.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_reviews.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_selectiong_container.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_title_with_rating.dart';
import 'package:car_rental/features/home/presentation/views/widgets/contact_car_row.dart';
import 'package:car_rental/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:car_rental/features/home/presentation/views/widgets/custom_car_details_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarDetailsViewBody extends StatefulWidget {
  const CarDetailsViewBody({super.key});

  @override
  State<CarDetailsViewBody> createState() => _CarDetailsViewBodyState();
}

class _CarDetailsViewBodyState extends State<CarDetailsViewBody> {
  late CarEntity car;

  @override
  void initState() {
    car = context.read<GetOneCarCubit>().car;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomAppBar(),
              ),
              const SizedBox(height: 20),
              const Divider(color: Color(0xFFD9D9D9)),
              const SizedBox(height: 20),
              CarDetailsSlider(
                images: context.read<GetOneCarCubit>().car.images,
              ),
              const SizedBox(height: 28),
              CarInfoContainer(
                widget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      CarTitleWithRating(
                        rate: car.averageRate,
                        name: car.name,
                        description: car.description,
                        reviewsCount: car.reviewsCount,
                      ),
                      const SizedBox(height: 28),
                      const Divider(color: Color(0xFFD9D9D9)),
                      const SizedBox(height: 28),
                      const ContactCardRow(),
                      const SizedBox(height: 28),
                      Carfeatures(features: car.carFeatures),
                      const SizedBox(height: 28),
                      const CarReviews(),
                      const SizedBox(height: 28),
                      const CustomCarDetailsButton(),
                      const SizedBox(height: 28),
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
