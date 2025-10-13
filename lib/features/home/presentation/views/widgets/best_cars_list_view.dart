import 'package:car_rental/features/home/presentation/manager/best_cars/best_cars_cubit.dart';
import 'package:car_rental/features/home/presentation/views/car_details.dart';
import 'package:car_rental/features/home/presentation/views/widgets/best_car_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestCarsListView extends StatelessWidget {
  const BestCarsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestCarsCubit, BestCarsState>(
      builder: (context, state) {
        if (state is BestCarsSuccess) {
          return SizedBox(
            height: 269,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CarDetails.routeName);
                    },
                    child: BestCarItem(car: state.cars[index]),
                  ),
                );
              },
            ),
          );
        } else if (state is BestCarsFailure) {
          return Text(state.errorMessage);
        } else {
          return const Text("Loading");
        }
      },
    );
  }
}
