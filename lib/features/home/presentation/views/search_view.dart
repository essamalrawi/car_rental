import 'package:car_rental/features/home/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const routeName = "search-view";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(extendBody: true, body: SearchViewBody());
  }
}
