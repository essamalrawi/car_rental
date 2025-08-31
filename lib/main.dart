import 'package:car_rental/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

import 'core/helper_functions/on_generate_route.dart';

void main() {
  runApp(const CarRental());
}

class CarRental extends StatelessWidget {
  const CarRental({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //  fontFamily: 'Tajawal',
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: OnBoardingView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
