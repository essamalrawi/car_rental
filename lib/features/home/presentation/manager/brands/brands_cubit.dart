import 'package:bloc/bloc.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/domain/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit(this.homeRepo) : super(BrandsInitial());

  final HomeRepo homeRepo;
  Future<void> getBrands() async {
    emit(BrandsLoading());
    final result = await homeRepo.getBrands();
    result.fold(
      (failure) {
        print("Failed to load brands: ${failure.message}");
        emit(BrandsFailure(errorMessage: failure.message));
      },
      (brands) {
        // print("Brands in cubit: ${brands.length}");
        emit(BrandsSuccess(brands: brands));
      },
    );
  }
}
