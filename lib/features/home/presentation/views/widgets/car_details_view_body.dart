import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_details_slider.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_selectiong_container.dart';
import 'package:car_rental/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CarDetailsViewBody extends StatelessWidget {
  const CarDetailsViewBody({super.key});

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
              const CarDetailsSlider(),
              const SizedBox(height: 28),
              CarInfoContainer(
                widget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tesla Model S",
                                  style: TextStyles.semibold30.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 18),

                                Text(
                                  "A car with high specs that are rented ot an affordable price.",
                                  style: TextStyles.regular14.copyWith(
                                    color: const Color(0xFF7F7F7F),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Column(children: [Text("5.0")]),
                        ],
                      ),
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
