import 'package:car_rental/features/home/presentation/views/home_view.dart';
import 'package:car_rental/features/home/presentation/views/search_view.dart';
import 'package:flutter/material.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});
  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: [const HomeView(), const SearchView()],
    );
  }
}
