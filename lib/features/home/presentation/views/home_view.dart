import 'package:car_rental/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  // static const routeName = "home_view";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(extendBody: true, body: HomeViewBody());
  }
}
