import 'package:bloc/bloc.dart';
import 'package:car_rental/features/auth/domain/entities/location_entity.dart';
import 'package:car_rental/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'get_locations_state.dart';

class GetLocationsCubit extends Cubit<GetLocationsState> {
  GetLocationsCubit(this.authRepo) : super(GetLocationsInitial());

  final AuthRepo authRepo;

  Future<void> getLocations() async {
    emit(GetLocationsLoading());
    final result = await authRepo.getLocations();

    result.fold(
      (failure) {
        emit(GetLocationsFailure(errorMessage: failure.message));
      },
      (locations) {
        emit(GetLocationsSuccess(locations: locations));
      },
    );
  }
}
