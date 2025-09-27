import 'package:car_rental/constants.dart';
import 'package:car_rental/core/services/shared_preferences_singleton.dart';
import 'package:car_rental/features/auth/presentation/views/sign_in_view.dart';
import 'package:car_rental/features/home/presentation/views/home_view.dart';
import 'package:car_rental/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});
  static const routeName = "startup-view";

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  void initState() {
    excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void excuteNaviagtion() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(milliseconds: 300), () {
      if (isOnBoardingViewSeen) {
        var token = Prefs.getString(kAccessToken);
        var isLoggedIn = token != null && token.isNotEmpty;
        print("hello?" + token);

        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SignInView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
