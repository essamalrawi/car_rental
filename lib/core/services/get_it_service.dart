import 'package:car_rental/core/services/quent_auth_service.dart';
import 'package:car_rental/features/auth/domain/data/repos/auth_repo_impl.dart';
import 'package:car_rental/features/auth/domain/repos/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<QuentAuthService>(QuentAuthService(getIt<Dio>()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt<QuentAuthService>()));
}
