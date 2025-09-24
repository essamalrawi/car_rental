import 'package:another_flushbar/flushbar.dart';
import 'package:car_rental/features/auth/presentation/manager/cubits/verify_phone_number/verify_phone_number_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/verify_your_phone_number_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyYourPhoneNumberViewBodyBlocConsumer extends StatelessWidget {
  const VerifyYourPhoneNumberViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyPhoneNumberCubit, VerifyPhoneNumberState>(
      listener: (context, state) {
        if (state is VerifyPhoneNumberRequestFailure) {
          Flushbar(
            title: "Something Went Wrong",
            message: "Please try again later.",
            duration: const Duration(seconds: 5),
            backgroundColor: const Color.fromARGB(255, 192, 4, 4), // red tone
            icon: const Icon(Icons.error_outline, color: Colors.white),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        }
      },

      builder: (context, state) {
        return const VerifyYourPhoneNumberViewBody();
      },
    );
  }
}
