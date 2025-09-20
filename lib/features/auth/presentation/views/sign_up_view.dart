import 'package:car_rental/features/auth/presentation/views/widgets/sign_up_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../cubits/get_countries/get_countries_cubit.dart';
import '../../cubits/sign_up/sign_up_cubit.dart';
import '../../domain/repos/auth_repo.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = "sign_up";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpCubit(getIt<AuthRepo>())),
        BlocProvider(create: (context) => GetCountriesCubit(getIt<AuthRepo>())),
      ],
      child: const Scaffold(
        body: SafeArea(child: SignUpViewBodyBlocConsumer()),
      ),
    );
  }
}
