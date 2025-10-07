import 'package:car_rental/core/constants/api_constants.dart';
import 'package:car_rental/core/errors/failure.dart';
import 'package:car_rental/features/auth/domain/data/models/user_model/user_model.dart';
import 'package:car_rental/core/models/refresh_model.dart';
import 'package:car_rental/features/auth/domain/data/models/country_model/country_model.dart';
import 'package:car_rental/features/auth/domain/data/models/location_model/location_model.dart';
import 'package:car_rental/features/auth/domain/data/models/request_password_reset_code_mode/request_password_reset_code_mode.dart';
import 'package:car_rental/features/auth/domain/data/models/request_verify_phone_model/request_verify_phone_model.dart';
import 'package:car_rental/features/auth/domain/data/models/reset_password_model/reset_password_model.dart';
import 'package:car_rental/features/home/domain/data/models/brand/brand_model.dart';
import 'package:dio/dio.dart';

class QuentAuthService {
  final Dio dio;

  QuentAuthService(this.dio);

  Future<UserModel> signUp({
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

      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final formData = FormData.fromMap({"email": email, "password": password});

      final response = await dio.post(
        "$kBaseUrl/api/auth/login/",
        data: formData,
      );

      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }

  Future<List<CountryModel>> getCountries() async {
    try {
      final response = await dio.get(
        "$kBaseUrl/api/public/countries/?page_size=245",
      );
      final List<dynamic> data = response.data['data'];

      // final countries = data.map((e) => CountryEntity.fromJson(e)).toList();
      final countries = data
          .map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return countries;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }

  Future<RequestPasswordResetCodeModel> requestPasswordResetCode({
    required String email,
  }) async {
    try {
      final response = await dio.post(
        "$kBaseUrl/api/auth/forgot_password/",
        data: {"email": email},
      );

      return RequestPasswordResetCodeModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }

  Future<ResetPasswordModel> resetPassword({
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

      return ResetPasswordModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }

  Future<List<LocationModel>> getLocations() async {
    try {
      final response = await dio.get("$kBaseUrl/api/public/register_locations");

      final List<dynamic> data = response.data['data'];

      final locations = data
          .map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return locations;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }

  Future<RequestVerifyPhoneModel> requestVeifyCode({
    required String phoneNumber,
    required String accessToken,
  }) async {
    try {
      final response = await dio.post(
        "$kBaseUrl/api/auth/phone/request_verify_code/",

        data: {"phone": phoneNumber},

        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      );

      return RequestVerifyPhoneModel.fromJson(response.data);
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

  Future<List<BrandModel>> getBrands() async {
    try {
      final response = await dio.get("$kBaseUrl/api/brands");

      final List<dynamic> data = response.data['data'];

      final brands = data
          .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
          .toList();

      print(brands.length);
      return brands;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }
}
