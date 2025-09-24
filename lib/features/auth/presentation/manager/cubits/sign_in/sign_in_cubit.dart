import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:car_rental/features/auth/domain/repos/auth_repo.dart';

import '../../../../domain/entities/user_entity.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());

    final result = await authRepo.signIn(email: email, password: password);

    result.fold(
      (failure) {
        emit(SignInFailure(errorMessage: failure.message));
      },
      (userEntity) {
        emit(SignInSuccess(userEntity: userEntity));
      },
    );
  }
}
