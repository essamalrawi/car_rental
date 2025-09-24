part of 'get_countries_cubit.dart';

@immutable
sealed class GetCountriesState {}

final class GetCountriesInitial extends GetCountriesState {}

final class GetCountriesLoading extends GetCountriesState {}

final class GetCountriesSuccess extends GetCountriesState {
  final List<CountryEntity> countries;

  GetCountriesSuccess({required this.countries});
}

final class GetCountriesFailure extends GetCountriesState {
  final String errorMessage;

  GetCountriesFailure({required this.errorMessage});
}
