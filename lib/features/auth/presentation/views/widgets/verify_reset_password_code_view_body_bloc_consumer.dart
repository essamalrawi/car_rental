import 'package:car_rental/features/auth/cubits/reset_password/reset_password_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/verify_reset_password_code_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyResetPasswordCodeViewBodyBlocConsumer extends StatelessWidget {
  const VerifyResetPasswordCodeViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      builder: (state, context) {
        return const VerifyResetPasswordCodeViewBody();
      },
      listener: (state, context) {},
    );
  }
}
