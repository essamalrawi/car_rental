import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/features/home/presentation/manager/brands/brands_cubit.dart';
import 'package:car_rental/features/home/presentation/manager/nearby_cars/nearby_cars_cubit.dart';
import 'package:car_rental/features/home/presentation/views/widgets/best_cars_list_view.dart';
import 'package:car_rental/features/home/presentation/views/widgets/best_cars_section.dart';
import 'package:car_rental/features/home/presentation/views/widgets/brands_section.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_selectiong_container.dart';
import 'package:car_rental/features/home/presentation/views/widgets/custom_search_bar_button.dart';
import 'package:car_rental/features/home/presentation/views/widgets/filter_search_widget.dart';
import 'package:car_rental/features/home/presentation/views/widgets/nearby_car.dart';
import 'package:car_rental/features/home/presentation/views/widgets/notifications_widget.dart';
import 'package:car_rental/features/home/presentation/views/widgets/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                    IconHolder(iconImage: Assets.imagesIconFilterIcon),
                  ],
                ),

                const SizedBox(height: 28),

                BlocBuilder<BrandsCubit, BrandsState>(
                  builder: (context, state) {
                    if (state is BrandsSuccess) {
                      return BrandsSection(brands: state.brands);
                    } else {
                      return const Text("Still loading");
                    }
                  },
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: CarInfoContainer(
            widget: Padding(
              padding: EdgeInsets.all(20),

              child: Column(
                children: [
                  BestCarsSection(),
                  SizedBox(height: 50),
                  BestCarsListView(),
                ],
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: CarInfoContainer(
            widget: Padding(
              padding: const EdgeInsets.all(20),
              child: BlocBuilder<NearbyCarsCubit, NearbyCarsState>(
                builder: (context, state) {
                  if (state is NearbyCarsSuccess) {
                    return NearbyCar(car: state.cars[0]);
                  } else if (state is NearbyCarsFaliure) {
                    return Text(state.errorMessage);
                  } else {
                    return const SpinKitFadingCircle(
                      color: Colors.black,
                      size: 50.0,
                    );
                  }
                },
              ),
            ),
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
