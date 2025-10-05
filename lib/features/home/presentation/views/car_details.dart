import 'package:car_rental/features/home/presentation/views/widgets/car_details_view_body.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});
  static const routeName = "car-details";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: CarDetailsViewBody()));
  }
}
