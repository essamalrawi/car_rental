part of 'nearby_cars_cubit.dart';

@immutable
sealed class NearbyCarsState {}

final class NearbyCarsInitial extends NearbyCarsState {}

final class NearbyCarsLoading extends NearbyCarsState {}

final class NearbyCarsFaliure extends NearbyCarsState {
  final String errorMessage;

  NearbyCarsFaliure({required this.errorMessage});
}

final class NearbyCarsSuccess extends NearbyCarsState {
  final List<CarEntity> cars;

  NearbyCarsSuccess({required this.cars});
}
