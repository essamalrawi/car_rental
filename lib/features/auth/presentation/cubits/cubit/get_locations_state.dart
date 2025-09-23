part of 'get_locations_cubit.dart';

@immutable
sealed class GetLocationsState {}

final class GetLocationsInitial extends GetLocationsState {}

final class GetLocationsLoading extends GetLocationsState {}

final class GetLocationsFailure extends GetLocationsState {
  final String errorMessage;

  GetLocationsFailure({required this.errorMessage});
}

final class GetLocationsSuccess extends GetLocationsState {
  final List<LocationEntity> locations;

  GetLocationsSuccess({required this.locations});
}
