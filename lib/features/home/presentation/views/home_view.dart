import 'package:car_rental/core/constants/auth_keys.dart';
import 'package:car_rental/core/services/get_it_service.dart';
import 'package:car_rental/core/services/shared_preferences_singleton.dart';
import 'package:car_rental/features/home/domain/repos/home_repo.dart';
import 'package:car_rental/features/home/presentation/manager/best_cars/best_cars_cubit.dart';
import 'package:car_rental/features/home/presentation/manager/brands/brands_cubit.dart';
import 'package:car_rental/features/home/presentation/manager/nearby_cars/nearby_cars_cubit.dart';
import 'package:car_rental/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:car_rental/features/home/presentation/views/widgets/nearby_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  // static const routeName = "home_view";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BestCarsCubit(getIt<HomeRepo>())..getBestCars(),
        ),
        BlocProvider(
          create: (context) => BrandsCubit(getIt<HomeRepo>())..getBrands(),
        ),
        BlocProvider(
          create: (context) =>
              NearbyCarsCubit(getIt<HomeRepo>())
                ..getNearbyCars(accessToken: Prefs.getString(kAccessToken)),
        ),
      ],

      child: const Scaffold(extendBody: true, body: HomeViewBody()),
    );
  }
}
