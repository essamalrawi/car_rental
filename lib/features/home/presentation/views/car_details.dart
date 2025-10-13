import 'package:car_rental/core/services/get_it_service.dart';
import 'package:car_rental/features/home/domain/repos/home_repo.dart';
import 'package:car_rental/features/home/presentation/manager/get_one_car/get_one_car_cubit.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_details_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key, required this.carId});
  static const routeName = "car-details";
  final int carId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetOneCarCubit(getIt<HomeRepo>()..getOneCar(id: carId))
            ..getOneCar(id: carId),
      child: const Scaffold(
        body: SafeArea(child: CarDetailsViewBodyBlocConsumer()),
      ),
    );
  }
}
