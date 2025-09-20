import 'package:car_rental/features/auth/domain/entities/user_entity.dart';
import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../entities/country_entity.dart';
import '../entities/request_password_reset_code_entity.dart';
import '../entities/reset_password_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signUp({
    required String fullName,
    required String email,
    required String password,
    required int countryId,
    required String phone,
  });

  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, List<CountryEntity>>> getCountries();

  Future<Either<Failure, RequestPasswordResetCodeEntity>>
  requestPasswordResetCode({required String email});

  Future<Either<Failure, ResetPasswordEntity>> resetPassword({
    required String resetToken,
    required String code,
    required String password,
    required String confirmPassword,
  });
}
