import 'package:bloc/bloc.dart';
import 'package:car_rental/features/auth/domain/entities/user_entity.dart';
import 'package:car_rental/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
    required int countryId,
    required String phone,
  }) async {
    emit(SignUpLoading());

    final result = await authRepo.signUp(
      fullName: fullName,
      email: email,
      password: password,
      countryId: countryId,
      phone: phone,
    );

    result.fold(
      (failure) {
        emit(SignUpFailure(errorMessage: failure.message));
      },
      (userEntity) {
        emit(SignUpSuccess(userEntity: userEntity));
      },
    );
  }
}
