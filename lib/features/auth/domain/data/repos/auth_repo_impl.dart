import 'package:car_rental/core/errors/failure.dart';
import 'package:car_rental/features/auth/domain/entities/country_entity.dart';
import 'package:car_rental/features/auth/domain/entities/user_entity.dart';
import 'package:car_rental/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/services/quent_auth_service.dart';

class AuthRepoImpl extends AuthRepo {
  final QuentAuthService quentAuthService;

  AuthRepoImpl(this.quentAuthService);

  @override
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var result = await quentAuthService.signIn(
        email: email,
        password: password,
      );

      return Right(result.toEntity());
    } catch (e) {
      return Left(ServerFailure("there was an error"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String fullName,
    required String email,
    required String password,
    required int countryId,
    required String phone,
  }) async {
    try {
      var result = await quentAuthService.signUp(
        fullName: fullName,
        email: email,
        password: password,
        countryId: countryId,
        phone: phone,
      );

      return Right(result.toEntity());
    } catch (e) {
      return Left(ServerFailure("there was an error"));
    }
  }

  @override
  Future<Either<Failure, CountryEntity>> getCountryId() {
    // TODO: implement getCountryId
    throw UnimplementedError();
  }
}
