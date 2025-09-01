import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/auth/presentation/views/verify_your_phone_number_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case VerifyYourPhoneNumberView.routeName:
      return MaterialPageRoute(
        builder: (context) => const VerifyYourPhoneNumberView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
