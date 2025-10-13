import 'package:car_rental/features/auth/domain/entities/country_entity.dart';
import 'package:car_rental/features/auth/domain/entities/location_entity.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';

class CarEntity {
  final int id;
  final String name;
  final String description;
  final String firstImage;
  final List<CarImageEntity> images;
  final String carType;
  final BrandEntity brand;
  final ColorInfoEntity color;
  final List<CarFeatureEntity> carFeatures;
  final String seatingCapacity;
  final LocationInfoEntity location;
  final double averageRate;
  final bool isForRent;
  final String? dailyRent;
  final String? weeklyRent;
  final String? monthlyRent;
  final String? yearlyRent;
  final bool isForPay;
  final double? price;
  final bool availableToBook;
  final List<dynamic> reviews;
  final int reviewsCount;
  final double reviewsAvg;
  final CarOwnerEntity owner;
  CarEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.firstImage,
    required this.images,
    required this.carType,
    required this.brand,
    required this.color,
    required this.carFeatures,
    required this.seatingCapacity,
    required this.location,
    required this.averageRate,
    required this.isForRent,
    required this.dailyRent,
    required this.weeklyRent,
    required this.monthlyRent,
    required this.yearlyRent,
    required this.isForPay,
    required this.price,
    required this.availableToBook,
    required this.reviews,
    required this.reviewsCount,
    required this.reviewsAvg,
    required this.owner,
  });
}

class CarOwnerEntity {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final bool isPhoneVerified;
  final CountryEntity country;
  final LocationEntity location;

  CarOwnerEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.isPhoneVerified,
    required this.country,
    required this.location,
  });
}

class ColorInfoEntity {
  final int id;
  final String name;
  final String hexValue;

  ColorInfoEntity({
    required this.id,
    required this.name,
    required this.hexValue,
  });
}

class CarImageEntity {
  final int id;
  final String image;

  CarImageEntity({required this.id, required this.image});
}

class CarFeatureEntity {
  final int id;
  final String name;
  final String value;
  final String image;

  CarFeatureEntity({
    required this.id,
    required this.name,
    required this.value,
    required this.image,
  });
}

class LocationInfoEntity {
  final int id;
  final String name;
  final double lat;
  final double lng;

  LocationInfoEntity({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
  });
}
