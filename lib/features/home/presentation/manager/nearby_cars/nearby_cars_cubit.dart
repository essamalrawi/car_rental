import 'package:bloc/bloc.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/domain/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'nearby_cars_state.dart';

class NearbyCarsCubit extends Cubit<NearbyCarsState> {
  NearbyCarsCubit(this.homeRepo) : super(NearbyCarsInitial());
  final HomeRepo homeRepo;
  Future<void> getNearbyCars({required String accessToken}) async {
    emit(NearbyCarsLoading());
    final results = await homeRepo.getNearbyCars(accessToken: accessToken);
    results.fold(
      (left) {
        emit(NearbyCarsFaliure(errorMessage: left.message));
      },
      (right) {
        emit(NearbyCarsSuccess(cars: right));
      },
    );
  }
}
