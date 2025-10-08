import 'package:car_rental/core/services/get_it_service.dart';
import 'package:car_rental/features/home/domain/repos/home_repo.dart';
import 'package:car_rental/features/home/presentation/manager/home_data/home_data_cubit.dart';
import 'package:car_rental/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  // static const routeName = "home_view";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeDataCubit(getIt<HomeRepo>())
        ..getBrands()
        ..getBestCars(),
      child: const Scaffold(extendBody: true, body: HomeViewBody()),
    );
  }
}
