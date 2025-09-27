import 'package:car_rental/core/errors/failure.dart';
import 'package:car_rental/core/models/auth_response_model.dart';
import 'package:car_rental/core/models/refresh_model.dart';
import 'package:car_rental/features/auth/domain/entities/country_entity.dart';
import 'package:car_rental/features/auth/domain/entities/location_entity.dart';
import 'package:car_rental/features/auth/domain/entities/request_password_reset_code_entity.dart';
import 'package:car_rental/features/auth/domain/entities/request_verify_phone_entity.dart';
import 'package:dio/dio.dart';

import '../../constants.dart';
import '../../features/auth/domain/entities/reset_password_entity.dart';

class QuentAuthService {
  final Dio dio;

  QuentAuthService(this.dio);

  Future<AuthResponseModel> signUp({
    required String fullName,
    required String email,
    required String password,
    required int countryId,
    required String phone,
    required bool createCar,
    required int locationId,
  }) async {
    try {
      final formData = FormData.fromMap({
        "phone": phone,
        "email": email,
        "password": password,
        "country_id": countryId,
        "full_name": fullName,
        "location_id": locationId,
        "available_to_create_car": createCar,
      });
      final response = await dio.post(
        "$kBaseUrl/api/auth/register/",
        data: formData,
      );

      return AuthResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }

  Future<AuthResponseModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final formData = FormData.fromMap({"email": email, "password": password});

      final response = await dio.post(
        "$kBaseUrl/api/auth/login/",
        data: formData,
      );

      return AuthResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }

  Future<List<CountryEntity>> getCountries() async {
    try {
      final response = await dio.get(
        "$kBaseUrl/api/public/countries/?page_size=245",
      );
      final List<dynamic> data = response.data['data'];

      // final countries = data.map((e) => CountryEntity.fromJson(e)).toList();
      final countries = data
          .map((e) => CountryEntity.fromJson(e as Map<String, dynamic>))
          .toList();

      return countries;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }

  Future<RequestPasswordResetCodeEntity> requestPasswordResetCode({
    required String email,
  }) async {
    try {
      final response = await dio.post(
        "$kBaseUrl/api/auth/forgot_password/",
        data: {"email": email},
      );

      return RequestPasswordResetCodeEntity.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }

  Future<ResetPasswordEntity> resetPassword({
    required String resetToken,
    required String code,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await dio.post(
        "$kBaseUrl/api/auth/reset_password/",
        data: {
          "reset_token": resetToken,
          "code": code,
          "password": password,
          "confirm_password": confirmPassword,
        },
      );

      return ResetPasswordEntity.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }

  Future<List<LocationEntity>> getLocations() async {
    try {
      final response = await dio.get("$kBaseUrl/api/public/register_locations");

      final List<dynamic> data = response.data['data'];

      final locations = data
          .map((e) => LocationEntity.fromJson(e as Map<String, dynamic>))
          .toList();

      return locations;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }

  Future<RequestVeifyPhoneEntity> requestVeifyCode({
    required String phoneNumber,
    required String accessToken,
  }) async {
    try {
      final response = await dio.post(
        "$kBaseUrl/api/auth/phone/request_verify_code/",

        data: {"phone": phoneNumber},

        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      );

      return RequestVeifyPhoneEntity.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }

  Future<String> confirmVeifyCode({
    required String code,
    required String verifyToken,
    required String accessToken,
  }) async {
    try {
      final response = await dio.post(
        "$kBaseUrl/api/auth/phone/confirm_verify_code/",

        data: {"code": code, "verify_token": verifyToken},
        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      );

      return response.data['message'];
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }

  Future<RefreshTokenModel> refreshToken({required String refreshToken}) async {
    try {
      final response = await dio.post(
        "$kBaseUrl/api/auth/token/refresh/",

        data: {"refresh": refreshToken},
      );

      return RefreshTokenModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }
}
