import 'package:another_flushbar/flushbar.dart';
import 'package:car_rental/constants.dart';
import 'package:car_rental/core/services/shared_preferences_singleton.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../manager/cubits/sign_in/sign_in_cubit.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Prefs.setString(kAccessToken, state.userEntity.tokens.access);
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else if (state is SignInFailure) {
          Flushbar(
            title: "Error",
            message: state.errorMessage,
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
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoading ? true : false,
          child: const SignInViewBody(),
        );
      },
    );
  }
}
