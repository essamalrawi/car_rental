import 'package:bloc/bloc.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/domain/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'get_one_car_state.dart';

class GetOneCarCubit extends Cubit<GetOneCarState> {
  GetOneCarCubit(this.homeRepo) : super(GetOneCarInitial());

  final HomeRepo homeRepo;
  Future<void> getBrands({required int id}) async {
    emit(GetOneCarLoading());
    final result = await homeRepo.getOneCar(id: id);
    result.fold(
      (failure) {
        print("Failed to load brands: ${failure.message}");
        emit(GetOneCarFailure(errorMessage: failure.message));
      },
      (car) {
        emit(GetOneCarSuccess(car: car));
      },
    );
  }
}
