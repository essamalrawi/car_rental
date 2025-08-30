import 'package:car_rental/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:car_rental/generated/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(Assets.imagesSplash, fit: BoxFit.cover),
    );
  }

  void excuteNaviagtion() {
    // bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    // Future.delayed(const Duration(seconds: 3), () {
    //   if (isOnBoardingViewSeen) {
    //     Navigator.pushReplacementNamed(context, SigninView.routeName);
    //   } else {
    //     Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    //   }
    // });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }
}
