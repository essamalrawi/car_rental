import 'package:car_rental/features/home/presentation/manager/get_one_car/get_one_car_cubit.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CarDetailsViewBodyBlocConsumer extends StatelessWidget {
  const CarDetailsViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetOneCarCubit, GetOneCarState>(
      builder: (context, state) {
        if (state is GetOneCarSuccess) {
          return const CarDetailsViewBody();
        } else if (state is GetOneCarFailure) {
          return Text(state.errorMessage);
        } else {
          return const SpinKitFadingCircle(color: Colors.black, size: 50.0);
        }
      },
      listener: (context, state) {},
    );
  }
}
