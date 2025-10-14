import 'package:car_rental/core/errors/failure.dart';
import 'package:car_rental/features/auth/domain/entities/reviews_entity.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BrandEntity>>> getBrands();
  Future<Either<Failure, List<CarEntity>>> getBestCars();
  Future<Either<Failure, CarEntity>> getOneCar({required int id});
  Future<Either<Failure, List<ReviewsEntity>>> getCarReviews({required int id});
  Future<Either<Failure, List<CarEntity>>> getNearbyCars({
    required accessToken,
  });
}
