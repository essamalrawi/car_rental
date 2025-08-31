import 'package:car_rental/features/auth/presentation/views/sign_in_view.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/assets.dart';
import 'on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;

  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              OnBoardingPageView(
                currentPage: currentPage,
                pageController: pageController,
              ),
              Positioned(
                top: 30,
                left: 24,
                child: SizedBox(
                  height: 65,
                  width: 65,
                  child: Image.asset(Assets.imagesLogo, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                right: 18,
                left: 18,
                bottom: 145,
                child: DotsIndicator(
                  dotsCount: 2,
                  position: pageController.hasClients
                      ? pageController.page ?? currentPage.toDouble()
                      : currentPage.toDouble(),
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    spacing: const EdgeInsets.symmetric(horizontal: 4),
                    activeShape: const StadiumBorder(),
                    color: Colors.white,
                    activeColor: Color(0xff9CA3AF),
                  ),
                ),
              ),
              Positioned(
                right: 18,
                left: 18,
                bottom: 55,
                child: CustomButton(
                  text: "Get Started",
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      SignInView.routeName,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
