import 'package:car_rental/features/auth/presentation/manager/cubits/reset_password/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomOtpTextFormField extends StatelessWidget {
  const CustomOtpTextFormField({
    super.key,
    this.onSaved,
    this.onChanged2,
    required this.controller,
  });

  final void Function(String?)? onSaved;
  final void Function(String)? onChanged2;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is CodeChanged || state is ResetPasswordFailure) {
          controller.clear();
        }
      },
      child: SizedBox(
        height: 68,
        width: 64,
        child: TextFormField(
          controller: controller,
          onSaved: onSaved,
          onChanged: (value) {
            if (value.length == 1) FocusScope.of(context).nextFocus();
            onChanged2?.call(value);
          },
          decoration: InputDecoration(
            border: buildOutlineInputBorder(),
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
          ),
          style: Theme.of(context).textTheme.headlineMedium,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: Color(0xFFD7D7D7)),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
