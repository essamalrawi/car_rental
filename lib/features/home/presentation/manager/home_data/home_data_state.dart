part of 'home_data_cubit.dart';

@immutable
sealed class HomeDataState {}

final class HomeDataInitial extends HomeDataState {}

final class HomeDataBrandsLoading extends HomeDataState {}

final class HomeDataBrandsSuccess extends HomeDataState {
  HomeDataBrandsSuccess();
}

final class HomeDataBrandsFailure extends HomeDataState {
  final String errorMessage;
  HomeDataBrandsFailure(this.errorMessage);
}

final class HomeDataBestCarsLoading extends HomeDataState {}

final class HomeDataBestCarsSuccess extends HomeDataState {
  HomeDataBestCarsSuccess();
}

final class HomeDataBestCarsFailure extends HomeDataState {
  final String errorMessage;
  HomeDataBestCarsFailure(this.errorMessage);
}
