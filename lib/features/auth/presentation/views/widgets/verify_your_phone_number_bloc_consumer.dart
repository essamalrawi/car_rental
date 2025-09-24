import 'package:car_rental/features/auth/presentation/manager/cubits/verify_phone_number/verify_phone_number_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/verification_code_view.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/verify_your_phone_number_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyYourPhoneNumberBlocConsumer extends StatelessWidget {
  const VerifyYourPhoneNumberBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (context, state) {
        return const VerifyYourPhoneNumberViewBody();
      },
      listener: (context, state) {
        if (state is VerifyPhoneNumberRequestSuccess) {
          Navigator.pushReplacementNamed(
            context,
            VerificationCodeView.routeName,
            arguments: context.read<VerifyPhoneNumberCubit>(),
          );
        }
      },
    );
  }
}
