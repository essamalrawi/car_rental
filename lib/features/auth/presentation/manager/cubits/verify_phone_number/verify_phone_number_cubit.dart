import 'package:bloc/bloc.dart';
import 'package:car_rental/features/auth/domain/entities/request_verify_phone_entity.dart';
import 'package:car_rental/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'verify_phone_number_state.dart';

class VerifyPhoneNumberCubit extends Cubit<VerifyPhoneNumberState> {
  VerifyPhoneNumberCubit(this.authRepo) : super(VerifyPhoneNumberInitial());

  final AuthRepo authRepo;

  Future<void> requestVerifyPhoneNumber({required String phone}) async {
    emit(VerifyPhoneNumberRequestLoading());

    final result = await authRepo.requestVeifyPhoneCode(phone: phone);

    result.fold(
      (failure) {
        emit(VerifyPhoneNumberRequestFailure(errorMessage: failure.message));
      },
      (success) {
        emit(VerifyPhoneNumberRequestSuccess(requestVeifyPhoneEntity: success));
      },
    );
  }

  Future<void> verifyPhoneNumber({
    required String code,
    required String verifyCode,
  }) async {
    emit(VerifyPhoneNumberLoading());

    final result = await authRepo.confirmVeifyCode(
      code: code,
      verifyToken: verifyCode,
    );

    result.fold(
      (failure) {
        emit(VerifyPhoneNumberFailure(errorMessage: failure.message));
      },
      (success) {
        emit(VerifyPhoneNumberSuccess());
      },
    );
  }
}
