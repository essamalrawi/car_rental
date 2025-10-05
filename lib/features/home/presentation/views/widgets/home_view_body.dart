import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/features/home/presentation/views/car_details.dart';
import 'package:car_rental/features/home/presentation/views/widgets/best_car_item.dart';
import 'package:car_rental/features/home/presentation/views/widgets/best_cars_section.dart';
import 'package:car_rental/features/home/presentation/views/widgets/brands_section.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_selectiong_container.dart';
import 'package:car_rental/features/home/presentation/views/widgets/custom_search_bar_button.dart';
import 'package:car_rental/features/home/presentation/views/widgets/filter_search_widget.dart';
import 'package:car_rental/features/home/presentation/views/widgets/nearby_car.dart';
import 'package:car_rental/features/home/presentation/views/widgets/notifications_widget.dart';
import 'package:car_rental/features/home/presentation/views/widgets/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 22),
                Row(
                  children: [
                    SvgPicture.asset(Assets.imagesIconAuthViewLogo),
                    const Spacer(),
                    const NotificationsWidget(),
                    const SizedBox(width: 15),
                    const ProfilePic(),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(color: Color(0xffD7D7D7)),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(child: CustomSearchBarButton()),
                    SizedBox(width: 26),
                    FilterSearchWidget(),
                  ],
                ),

                const SizedBox(height: 28),
                const BrandsSection(),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CarInfoContainer(
            widget: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                children: [
                  const BestCarsSection(),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 269,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                CarDetails.routeName,
                              );
                            },

                            child: const BestCarItem(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SliverToBoxAdapter(
          child: CarInfoContainer(
            widget: Padding(padding: EdgeInsets.all(20), child: NearbyCar()),
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
