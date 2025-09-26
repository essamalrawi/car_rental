import 'package:car_rental/core/services/get_it_service.dart';
import 'package:car_rental/features/auth/domain/repos/auth_repo.dart';
import 'package:car_rental/features/auth/presentation/manager/cubits/otp_cubit/otp_cubit.dart';
import 'package:car_rental/features/auth/presentation/manager/cubits/verify_phone_number/verify_phone_number_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/verification_code_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

  static const routeName = "verification_code";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OtpCubit()),
        BlocProvider(
          create: (context) => VerifyPhoneNumberCubit(getIt<AuthRepo>()),
        ),
      ],

      child: const Scaffold(
        body: SafeArea(child: VerificationCodeViewBodyBlocConsumer()),
      ),
    );
  }
}
