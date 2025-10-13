part of 'get_one_car_cubit.dart';

@immutable
sealed class GetOneCarState {}

final class GetOneCarInitial extends GetOneCarState {}

final class GetOneCarLoading extends GetOneCarState {}

final class GetOneCarFailure extends GetOneCarState {
  final String errorMessage;

  GetOneCarFailure({required this.errorMessage});
}

final class GetOneCarSuccess extends GetOneCarState {
  GetOneCarSuccess();
}
