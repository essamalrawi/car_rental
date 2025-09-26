import 'package:another_flushbar/flushbar.dart';
import 'package:car_rental/features/auth/presentation/manager/cubits/otp_cubit/otp_cubit.dart';
import 'package:car_rental/features/auth/presentation/manager/cubits/reset_password/reset_password_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/verify_reset_password_code_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyResetPasswordCodeViewBodyBlocConsumer extends StatelessWidget {
  const VerifyResetPasswordCodeViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordFailure) {
          Flushbar(
            title: "Something Went Wrong",
            message: state.errorMessage,
            duration: const Duration(seconds: 5),
            backgroundColor: const Color.fromARGB(255, 192, 4, 4), // red tone
            icon: const Icon(Icons.error_outline, color: Colors.white),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
          context.read<OtpCubit>().clear();
        }
      },

      builder: (context, state) {
        return const VerifyResetPasswordCodeViewBody();
      },
    );
  }
}
