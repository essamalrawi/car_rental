import 'package:bloc/bloc.dart';
import 'package:car_rental/constants.dart';
import 'package:car_rental/core/services/shared_preferences_singleton.dart';
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
    required bool createCar,
    required int locationId,
  }) async {
    emit(SignUpLoading());

    final result = await authRepo.signUp(
      fullName: fullName,
      email: email,
      password: password,
      countryId: countryId,
      phone: phone,
      createCar: createCar,
      locationId: locationId,
    );

    result.fold(
      (failure) {
        emit(SignUpFailure(errorMessage: failure.message));
      },
      (userEntity) {
        Prefs.setString(kaccessToken, userEntity.tokens.access);

        emit(SignUpSuccess(userEntity: userEntity));
      },
    );
  }
}
