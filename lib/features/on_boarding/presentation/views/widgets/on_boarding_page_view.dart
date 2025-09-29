import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.pageController,
    required this.currentPage,
  });

  final PageController pageController;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        const PageViewItem(
          backgroundImage: Assets.imagesOnBoardingPageOne,
          title: 'Welcome to\nQent',
        ),
        const PageViewItem(
          backgroundImage: Assets.imagesOnBoardingPageTwo,
          title: 'Lets Start\nA New Experience\nWith Car rental.',
          subtitle:
              'Discover your next adventure with Qent. we’re here to provide you with a seamless car rental experience. Let’s get started on your journey.',
        ),
      ],
    );
  }
}
