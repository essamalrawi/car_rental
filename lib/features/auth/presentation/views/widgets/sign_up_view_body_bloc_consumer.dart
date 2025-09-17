import 'package:car_rental/core/helper_functions/show_bars.dart';
import 'package:car_rental/features/auth/cubits/sign_up/sign_up_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:car_rental/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../cubits/get_countries/get_countries_cubit.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else if (state is SignUpFailure) {
          showBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        context.read<GetCountriesCubit>().getCountries();
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading ? true : false,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
