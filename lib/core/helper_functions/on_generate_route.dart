import 'package:car_rental/features/auth/presentation/manager/cubits/reset_password/reset_password_cubit.dart';
import 'package:car_rental/features/auth/presentation/manager/cubits/verify_phone_number/verify_phone_number_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/new_passwrod_view.dart';
import 'package:car_rental/features/auth/presentation/views/verify_reset_password_code_view.dart';
import 'package:car_rental/features/home/presentation/views/car_details.dart';
import 'package:car_rental/features/on_boarding/presentation/views/main_view.dart';
import 'package:car_rental/features/on_boarding/presentation/views/startup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/views/reset_your_password_view.dart';
import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/auth/presentation/views/verification_code_view.dart';
import '../../features/auth/presentation/views/verify_your_phone_number_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case StartupView.routeName:
      return MaterialPageRoute(builder: (context) => const StartupView());
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
      final cubit = settings.arguments as VerifyPhoneNumberCubit;
      return MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: cubit,
          child: const VerificationCodeView(),
        ),
      );
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
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

    case CarDetails.routeName:
      final carId = settings.arguments as int;
      return CupertinoPageRoute(builder: (context) => CarDetails(carId: carId));
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
