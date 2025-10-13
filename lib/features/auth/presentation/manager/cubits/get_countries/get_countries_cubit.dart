import 'package:bloc/bloc.dart';
import 'package:car_rental/features/auth/domain/entities/country_entity.dart';
import 'package:meta/meta.dart';

import '../../../../domain/repos/auth_repo.dart';

part 'get_countries_state.dart';

class GetCountriesCubit extends Cubit<GetCountriesState> {
  GetCountriesCubit(this.authRepo) : super(GetCountriesInitial());

  final AuthRepo authRepo;

  Future<void> getCountries() async {
    emit(GetCountriesLoading());
    final result = await authRepo.getCountries();

    result.fold(
      (failure) {
        emit(GetCountriesFailure(errorMessage: failure.message));
      },
      (countries) {
        emit(GetCountriesSuccess(countries: countries));
      },
    );
  }
}
