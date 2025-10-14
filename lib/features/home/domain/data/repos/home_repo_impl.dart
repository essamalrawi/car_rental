import 'package:car_rental/core/errors/failure.dart';
import 'package:car_rental/core/services/quent_auth_service.dart';
import 'package:car_rental/features/auth/domain/data/models/review_model/review_model.dart';
import 'package:car_rental/features/auth/domain/entities/reviews_entity.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final QuentAuthService quentAuthService;

  HomeRepoImpl(this.quentAuthService);

  @override
  Future<Either<Failure, List<BrandEntity>>> getBrands() async {
    try {
      var result = await quentAuthService.getBrands();

      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDiorError(e));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, List<CarEntity>>> getBestCars() async {
    try {
      var result = await quentAuthService.getBestCars();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDiorError(e));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, CarEntity>> getOneCar({required int id}) async {
    try {
      var result = await quentAuthService.getOneCar(id: id);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDiorError(e));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, List<ReviewsEntity>>> getCarReviews({
    required int id,
  }) async {
    try {
      var result = await quentAuthService.getCarReview(id: id);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDiorError(e));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, List<CarEntity>>> getNearbyCars({
    required accessToken,
  }) async {
    try {
      var result = await quentAuthService.getNearbyCars(
        accessToken: accessToken,
      );

      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDiorError(e));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: ${e.toString()}"));
    }
  }
}
