import 'package:car_rental/core/services/get_it_service.dart';
import 'package:car_rental/features/auth/presentation/cubits/get_countries/get_countries_cubit.dart';
import 'package:car_rental/features/auth/domain/repos/auth_repo.dart';
import 'package:car_rental/features/auth/presentation/views/widgets/verify_your_phone_number_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyYourPhoneNumberView extends StatelessWidget {
  const VerifyYourPhoneNumberView({super.key});

  static const routeName = 'verify-number';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCountriesCubit(getIt<AuthRepo>())..getCountries(),
      child: const Scaffold(
        body: SafeArea(child: VerifyYourPhoneNumberViewBody()),
      ),
    );
  }
}
