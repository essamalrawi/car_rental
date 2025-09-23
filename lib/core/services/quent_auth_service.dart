import 'package:car_rental/core/errors/failure.dart';
import 'package:car_rental/core/models/auth_response_model.dart';
import 'package:car_rental/features/auth/domain/entities/country_entity.dart';
import 'package:car_rental/features/auth/domain/entities/location_entity.dart';
import 'package:car_rental/features/auth/domain/entities/request_password_reset_code_entity.dart';
import 'package:car_rental/features/auth/domain/entities/request_reset_phone_entity.dart';
import 'package:dio/dio.dart';

import '../../constants.dart';
import '../../features/auth/domain/entities/reset_password_entity.dart';

class QuentAuthService {
  final Dio dio;

  QuentAuthService(this.dio);

  Future<dynamic> signUp({
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
        "$baseUrl/api/auth/register/",
        data: formData,
      );

      print(response.data);

      return AuthResponseModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        return ServerFailure.fromDiorError(e);
      }
      return ServerFailure(e.toString());
    }
  }

  Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final formData = FormData.fromMap({"email": email, "password": password});
      final response = await dio.post(
        "$baseUrl/api/auth/login/",
        data: formData,
      );

      print(response.data);

      return AuthResponseModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        return ServerFailure.fromDiorError(e);
      }
      return ServerFailure(e.toString());
    }
  }

  Future<dynamic> getCountries() async {
    try {
      final response = await dio.get(
        "$baseUrl/api/public/countries/?page_size=245",
      );
      final List<dynamic> data = response.data['data'];

      // final countries = data.map((e) => CountryEntity.fromJson(e)).toList();
      final countries = data
          .map((e) => CountryEntity.fromJson(e as Map<String, dynamic>))
          .toList();

      return countries;
    } catch (e) {
      if (e is DioException) {
        return ServerFailure.fromDiorError(e);
      }
      return ServerFailure(e.toString());
    }
  }

  Future<dynamic> requestPasswordResetCode({required String email}) async {
    try {
      final response = await dio.post(
        "$baseUrl/api/auth/forgot_password/",
        data: {"email": email},
      );

      return RequestPasswordResetCodeEntity.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        return ServerFailure.fromDiorError(e);
      }
      return ServerFailure(e.toString());
    }
  }

  Future<dynamic> resetPassword({
    required String resetToken,
    required String code,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await dio.post(
        "$baseUrl/api/auth/reset_password/",
        data: {
          "reset_token": resetToken,
          "code": code,
          "password": password,
          "confirm_password": confirmPassword,
        },
      );

      print(response);

      return ResetPasswordEntity.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        return ServerFailure.fromDiorError(e);
      }
      return ServerFailure(e.toString());
    }
  }

  Future<dynamic> getLocations() async {
    try {
      final response = await dio.get("$baseUrl/api/public/register_locations");

      print(response);

      final List<dynamic> data = response.data['data'];

      final locations = data
          .map((e) => LocationEntity.fromJson(e as Map<String, dynamic>))
          .toList();

      return locations;
    } catch (e) {
      if (e is DioException) {
        return ServerFailure.fromDiorError(e);
      }
      return ServerFailure(e.toString());
    }
  }

  Future<dynamic> requestVeifyCode({required String phoneNumber}) async {
    try {
      final response = await dio.post(
        "$baseUrl/api/auth/phone/request_verify_code/",

        data: {"phone": phoneNumber},
      );

      print(response);

      return RequestVeifyPhoneEntity.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        return ServerFailure.fromDiorError(e);
      }
      return ServerFailure(e.toString());
    }
  }

  Future<dynamic> confirmVeifyCode({
    required String code,
    required String verifyToken,
  }) async {
    try {
      final response = await dio.post(
        "$baseUrl/api/auth/phone/request_verify_code/",

        data: {"code": code, "verify_token": verifyToken},
      );

      print(response);

      // To Do

      return User.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        return ServerFailure.fromDiorError(e);
      }
      return ServerFailure(e.toString());
    }
  }
}
