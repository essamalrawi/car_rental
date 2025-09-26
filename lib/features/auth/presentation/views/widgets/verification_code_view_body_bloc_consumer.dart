import 'package:another_flushbar/flushbar.dart';
import 'package:car_rental/features/auth/presentation/manager/cubits/otp_cubit/otp_cubit.dart';
import 'package:car_rental/features/auth/presentation/manager/cubits/verify_phone_number/verify_phone_number_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/verification_code_view_body.dart';
import 'package:car_rental/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeViewBodyBlocConsumer extends StatelessWidget {
  const VerificationCodeViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyPhoneNumberCubit, VerifyPhoneNumberState>(
      listener: (context, state) {
        if (state is VerifyPhoneNumberSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        }
        if (state is VerifyPhoneNumberRequestSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        }
        if (state is VerifyPhoneNumberRequestFailure) {
          Flushbar(
            title: "Error",
            message: state.errorMessage,
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.redAccent,
            icon: const Icon(Icons.error, color: Colors.white),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        }
        if (state is VerifyPhoneNumberFailure) {
          Flushbar(
            title: "Error",
            message: state.errorMessage,
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.redAccent,
            icon: const Icon(Icons.error, color: Colors.white),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);

          context.read<OtpCubit>().emitOptClear();
        }
      },

      builder: (context, state) {
        return const VerificationCodeViewBody();
      },
    );
  }
}
