import 'package:bloc/bloc.dart';
import 'package:car_rental/features/auth/domain/entities/request_password_reset_code_entity.dart';
import 'package:car_rental/features/auth/domain/entities/reset_password_entity.dart';
import 'package:car_rental/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());

  final AuthRepo authRepo;
  late String code = "";
  late RequestPasswordResetCodeEntity requestPasswordResetCodeEntity;
  Future<void> requestPasswordResetCode({required String email}) async {
    emit(ResetPasswordLoading());

    final result = await authRepo.requestPasswordResetCode(email: email);

    result.fold(
      (failure) {
        emit(ResetPasswordFailure(errorMessage: failure.message));
      },
      (success) {
        requestPasswordResetCodeEntity = success;
        emit(
          ResetPasswordRequestSuccess(requestPasswordResetCodeEntity: success),
        );
      },
    );
  }

  Future<void> resetPasswordResetCode({
    required String resetToken,
    required String code,
    required String password,
    required String confirmPassword,
  }) async {
    emit(ResetPasswordLoading());

    final result = await authRepo.resetPassword(
      resetToken: resetToken,
      code: code,
      password: password,
      confirmPassword: confirmPassword,
    );

    result.fold(
      (failure) {
        emit(ResetPasswordFailure(errorMessage: failure.message));
      },
      (success) {
        emit(ResetPasswordSuccess(resetPasswordEntity: success));
      },
    );
  }

  void resetCode() {
    code = '';
    emit(CodeChanged());
  }
}
