import 'package:car_rental/features/auth/presentation/manager/cubits/otp_cubit/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CustomOtpTextFormField.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});
  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();

  void _updateCode(BuildContext context) {
    final code =
        _controller1.text +
        _controller2.text +
        _controller3.text +
        _controller4.text;

    context.read<OtpCubit>().code = code;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomOtpTextFormField(
            controller: _controller1,
            onChanged2: (_) => _updateCode(context),
          ),
          CustomOtpTextFormField(
            controller: _controller2,
            onChanged2: (_) => _updateCode(context),
          ),
          CustomOtpTextFormField(
            controller: _controller3,
            onChanged2: (_) => _updateCode(context),
          ),
          CustomOtpTextFormField(
            controller: _controller4,
            onChanged2: (_) => _updateCode(context),
          ),
        ],
      ),
    );
  }
}
