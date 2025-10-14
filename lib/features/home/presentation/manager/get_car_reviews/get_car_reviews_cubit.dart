import 'package:bloc/bloc.dart';
import 'package:car_rental/features/auth/domain/entities/reviews_entity.dart';
import 'package:car_rental/features/home/domain/repos/home_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'get_car_reviews_state.dart';

class GetCarReviewsCubit extends Cubit<GetCarReviewsState> {
  GetCarReviewsCubit(this.homeRepo) : super(GetCarReviewsInitial());

  final HomeRepo homeRepo;

  Future<void> getCarReviews({required id}) async {
    emit(GetCarReviewsLoading());

    final results = await homeRepo.getCarReviews(id: id);

    results.fold(
      (failure) {
        emit(GetCarReviewsFaluire(errorMessage: failure.message));
      },
      (success) {
        emit(GetCarReviewsSuccess(reviews: success));
      },
    );
  }
}
