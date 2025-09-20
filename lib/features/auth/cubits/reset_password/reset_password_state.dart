part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordFailure extends ResetPasswordState {
  final String errorMessage;

  ResetPasswordFailure({required this.errorMessage});
}

final class ResetPasswordRequestSuccess extends ResetPasswordState {
  final RequestPasswordResetCodeEntity requestPasswordResetCodeEntity;

  ResetPasswordRequestSuccess({required this.requestPasswordResetCodeEntity});
}

final class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordEntity resetPasswordEntity;

  ResetPasswordSuccess({required this.resetPasswordEntity});
}

final class CodeChanged extends ResetPasswordState {}
