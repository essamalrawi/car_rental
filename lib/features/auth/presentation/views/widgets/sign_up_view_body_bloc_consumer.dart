import 'package:another_flushbar/flushbar.dart';
import 'package:car_rental/core/helper_functions/show_bars.dart';
import 'package:car_rental/features/auth/presentation/cubits/cubit/get_locations_cubit.dart';
import 'package:car_rental/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:car_rental/features/auth/presentation/views/verify_your_phone_number_view.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../cubits/get_countries/get_countries_cubit.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pushReplacementNamed(
            context,
            VerifyYourPhoneNumberView.routeName,
          );
        } else if (state is SignUpFailure) {
          Flushbar(
            title: "Validation Error",
            message: "Please ensure all required fields are filled correctly.",
            duration: const Duration(seconds: 5),
            backgroundColor: const Color(0xFFE53935), // nice red for errors
            icon: const Icon(Icons.error_outline, color: Colors.white),
            flushbarPosition: FlushbarPosition.TOP,
            borderRadius: BorderRadius.circular(8),
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(16),
            boxShadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ).show(context);
        }
      },
      builder: (context, state) {
        context.read<GetCountriesCubit>().getCountries();
        context.read<GetLocationsCubit>().getLocations();

        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading ? true : false,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
