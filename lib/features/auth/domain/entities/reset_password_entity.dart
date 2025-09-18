class ResetPasswordEntity {
  final String resetToken, code, password, confirmPassword;

  ResetPasswordEntity({
    required this.resetToken,
    required this.code,
    required this.password,
    required this.confirmPassword,
  });
}
