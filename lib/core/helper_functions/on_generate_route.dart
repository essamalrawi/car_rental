import 'package:car_rental/features/auth/presentation/cubits/reset_password/reset_password_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/new_passwrod_view.dart';
import 'package:car_rental/features/auth/presentation/views/verify_reset_password_code_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/views/reset_your_password_view.dart';
import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/auth/presentation/views/verification_code_view.dart';
import '../../features/auth/presentation/views/verify_your_phone_number_view.dart';
import '../../features/home/presentation/views/home_view.dart';
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
    case VerificationCodeView.routeName:
      return MaterialPageRoute(
        builder: (context) => const VerificationCodeView(),
      );
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case ResetYourPasswordView.routeName:
      return MaterialPageRoute(builder: (_) => const ResetYourPasswordView());
    case VerifyResetPasswordCodeView.routeName:
      final cubit = settings.arguments as ResetPasswordCubit;
      return MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: cubit,
          child: const VerifyResetPasswordCodeView(),
        ),
      );

    case NewPasswordView.routeName:
      final cubit = settings.arguments as ResetPasswordCubit;
      return MaterialPageRoute(
        builder: (_) =>
            BlocProvider.value(value: cubit, child: const NewPasswordView()),
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
