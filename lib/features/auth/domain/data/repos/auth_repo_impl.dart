import 'dart:developer';

import 'package:car_rental/core/errors/failure.dart';
import 'package:car_rental/features/auth/domain/entities/country_entity.dart';
import 'package:car_rental/features/auth/domain/entities/location_entity.dart';
import 'package:car_rental/features/auth/domain/entities/request_password_reset_code_entity.dart';
import 'package:car_rental/features/auth/domain/entities/request_verify_phone_entity.dart';
import 'package:car_rental/features/auth/domain/entities/reset_password_entity.dart';
import 'package:car_rental/features/auth/domain/entities/user_entity.dart';
import 'package:car_rental/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
    required bool createCar,
    required int locationId,
  }) async {
    try {
      var result = await quentAuthService.signUp(
        fullName: fullName,
        email: email,
        password: password,
        countryId: countryId,
        phone: phone,
        createCar: createCar,
        locationId: locationId,
      );

      return Right(result.toEntity());
    } catch (e) {
      return Left(ServerFailure("there was an error"));
    }
  }

  @override
  Future<Either<Failure, List<CountryEntity>>> getCountries() async {
    try {
      final result = await quentAuthService.getCountries();

      return Right(result);
    } catch (e) {
      return Left(ServerFailure("there was an error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> getLocations() async {
    try {
      final result = await quentAuthService.getLocations();

      return Right(result);
    } catch (e) {
      return Left(ServerFailure("there was an error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, RequestPasswordResetCodeEntity>>
  requestPasswordResetCode({required String email}) async {
    try {
      final result = await quentAuthService.requestPasswordResetCode(
        email: email,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure("Invalid email or something wrong happen"));
    }
  }

  @override
  Future<Either<Failure, ResetPasswordEntity>> resetPassword({
    required String resetToken,
    required String code,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final result = await quentAuthService.resetPassword(
        resetToken: resetToken,
        code: code,
        password: password,
        confirmPassword: confirmPassword,
      );

      return Right(result);
    } catch (e) {
      return Left(ServerFailure("there was an error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, RequestVeifyPhoneEntity>> requestVeifyPhoneCode({
    required String phone,
    required String accessToken,
  }) async {
    try {
      final result = await quentAuthService.requestVeifyCode(
        phoneNumber: phone,
        accessToken: accessToken,
      );

      return Right(result);
    } catch (e) {
      return Left(ServerFailure("there was an error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, String>> confirmVeifyCode({
    required String code,
    required String verifyToken,
    required String accessToken,
  }) async {
    try {
      final result = await quentAuthService.confirmVeifyCode(
        code: code,
        verifyToken: verifyToken,
        accessToken: accessToken,
      );
      print(result);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure("there was an error: ${e.toString()}"));
    }
  }
}
