import 'package:another_flushbar/flushbar.dart';
import 'package:car_rental/features/auth/presentation/manager/cubits/reset_password/reset_password_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/verify_reset_password_code_view.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/reset_your_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ResetYourPasswordBlocViewBodyBlocConsumer extends StatelessWidget {
  const ResetYourPasswordBlocViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ResetPasswordLoading ? true : false,
          child: const ResetYourPasswordViewBody(),
        );
      },
      listener: (context, state) {
        if (state is ResetPasswordRequestSuccess) {
          Navigator.pushNamed(
            context,
            VerifyResetPasswordCodeView.routeName,
            arguments: context.read<ResetPasswordCubit>(),
          );
          Flushbar(
            title: "Verification Code",
            message:
                "Your code is: ${state.requestPasswordResetCodeEntity.code}. Please use it within 10 seconds.",
            duration: const Duration(seconds: 10),
            backgroundColor: const Color.fromARGB(255, 4, 192, 89),
            icon: const Icon(Icons.check_circle, color: Colors.white),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        }

        if (state is ResetPasswordFailure) {
          context.read<ResetPasswordCubit>().code = "";
          Flushbar(
            title: "Error",
            message: state.errorMessage,
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.redAccent,
            icon: const Icon(Icons.error, color: Colors.white),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        }
      },
    );
  }
}
