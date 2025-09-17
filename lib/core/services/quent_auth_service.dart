import 'package:car_rental/core/errors/failure.dart';
import 'package:car_rental/core/models/auth_response_model.dart';
import 'package:car_rental/features/auth/domain/entities/country_entity.dart';
import 'package:dio/dio.dart';

import '../../constants.dart';

class QuentAuthService {
  final Dio dio;

  QuentAuthService(this.dio);

  Future<dynamic> signUp({
    required String fullName,
    required String email,
    required String password,
    required int countryId,
    required String phone,
  }) async {
    try {
      final formData = FormData.fromMap({
        "phone": phone,
        "email": email,
        "password": password,
        "country_id": countryId,
        "full_name": fullName,
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
}
