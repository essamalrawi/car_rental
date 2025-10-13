import 'package:bloc/bloc.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/domain/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'best_cars_state.dart';

class BestCarsCubit extends Cubit<BestCarsState> {
  BestCarsCubit(this.homeRepo) : super(BestCarsInitial());

  final HomeRepo homeRepo;

  Future<void> getBestCars() async {
    emit(BestCarsLoading());
    final result = await homeRepo.getBestCars();
    result.fold((failure) => emit(BestCarsFailure(failure.message)), (cars) {
      emit(BestCarsSuccess(cars: cars));
    });
  }
}
