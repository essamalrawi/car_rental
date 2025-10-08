import 'package:bloc/bloc.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/domain/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_data_state.dart';

class HomeDataCubit extends Cubit<HomeDataState> {
  HomeDataCubit(this.homeRepo) : super(HomeDataInitial());

  final List<BrandEntity> brands = [];
  final List<CarEntity> bestCars = [];

  final HomeRepo homeRepo;
  Future<void> getBrands() async {
    emit(HomeDataBrandsLoading());
    final result = await homeRepo.getBrands();
    result.fold(
      (failure) {
        print("Failed to load brands: ${failure.message}");
        emit(HomeDataBrandsFailure(failure.message));
      },
      (brands) {
        this.brands.addAll(brands);
        // print("Brands in cubit: ${brands.length}");
        emit(HomeDataBrandsSuccess());
      },
    );
  }

  Future<void> getBestCars() async {
    emit(HomeDataBestCarsLoading());
    final result = await homeRepo.getBestCars();
    result.fold((failure) => emit(HomeDataBestCarsFailure(failure.message)), (
      cars,
    ) {
      bestCars.addAll(cars);
      emit(HomeDataBestCarsSuccess());
    });
  }
}
