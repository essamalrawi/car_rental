part of 'best_cars_cubit.dart';

@immutable
sealed class BestCarsState {}

final class BestCarsInitial extends BestCarsState {}

final class BestCarsLoading extends BestCarsState {}

final class BestCarsSuccess extends BestCarsState {
  final List<CarEntity> cars;

  BestCarsSuccess({required this.cars});
}

final class BestCarsFailure extends BestCarsState {
  final String errorMessage;
  BestCarsFailure(this.errorMessage);
}
