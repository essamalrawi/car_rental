import 'package:car_rental/features/auth/presentation/manager/cubits/reset_password/reset_password_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/reset_your_password_bloc_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rental/core/services/get_it_service.dart';
import 'package:car_rental/features/auth/domain/repos/auth_repo.dart';


class ResetYourPasswordView extends StatelessWidget {
  const ResetYourPasswordView({super.key});

  static const routeName = "reset_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ResetPasswordCubit(getIt<AuthRepo>()),
          child: const ResetYourPasswordBlocViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
