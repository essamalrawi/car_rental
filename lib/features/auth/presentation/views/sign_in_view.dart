import 'package:car_rental/features/auth/presentation/views/widgets/sign_in_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:car_rental/core/services/get_it_service.dart';
import 'package:car_rental/features/auth/presentation/manager/cubits/sign_in/sign_in_cubit.dart';
import 'package:car_rental/features/auth/domain/repos/auth_repo.dart';


class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = "sign_in";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<AuthRepo>()),
      child: const Scaffold(
        body: SafeArea(child: SignInViewBodyBlocConsumer()),
      ),
    );
  }
}
