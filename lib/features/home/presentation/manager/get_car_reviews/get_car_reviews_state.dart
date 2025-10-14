part of 'get_car_reviews_cubit.dart';

@immutable
sealed class GetCarReviewsState {}

final class GetCarReviewsInitial extends GetCarReviewsState {}

final class GetCarReviewsLoading extends GetCarReviewsState {}

final class GetCarReviewsFaluire extends GetCarReviewsState {
  final String errorMessage;

  GetCarReviewsFaluire({required this.errorMessage});
}

final class GetCarReviewsSuccess extends GetCarReviewsState {
  final List<ReviewsEntity> reviews;

  GetCarReviewsSuccess({required this.reviews});
}
