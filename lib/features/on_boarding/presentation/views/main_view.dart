import 'package:car_rental/features/on_boarding/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:car_rental/features/on_boarding/presentation/views/widgets/main_view_body.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          currentViewIndex = index;
          setState(() {});
        },
      ),
      body: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
