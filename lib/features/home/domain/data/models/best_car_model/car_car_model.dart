import 'package:car_rental/features/auth/domain/data/models/country_model/country_model.dart';
import 'package:car_rental/features/auth/domain/data/models/location_model/location_model.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';

class CarModel extends CarEntity {
  CarModel({
    required super.id,
    required super.name,
    required super.description,
    required super.firstImage,
    required super.images,
    required super.carType,
    required super.brand,
    required super.color,
    required super.carFeatures,
    required super.seatingCapacity,
    required super.location,
    required super.averageRate,
    required super.isForRent,
    required super.dailyRent,
    required super.weeklyRent,
    required super.monthlyRent,
    required super.yearlyRent,
    required super.isForPay,
    required super.price,
    required super.availableToBook,
    required super.reviews,
    required super.reviewsCount,
    required super.reviewsAvg,
    required super.owner,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      firstImage: json['first_image'],
      images: (json['images'] as List)
          .map((e) => CarImageModel.fromJson(e))
          .toList(),
      carType: json['car_type'],
      brand: Brand.fromJson(json['brand']),
      color: ColorInfo.fromJson(json['color']),
      carFeatures: (json['car_features'] as List)
          .map((e) => CarFeature.fromJson(e))
          .toList(),
      seatingCapacity: json['seating_capacity'],
      location: LocationInfo.fromJson(json['location']),
      averageRate: (json['average_rate'] as num).toDouble(),
      isForRent: json['is_for_rent'],
      dailyRent: json['daily_rent'],
      weeklyRent: json['weekly_rent'],
      monthlyRent: json['monthly_rent'],
      yearlyRent: json['yearly_rent'],
      isForPay: json['is_for_pay'],
      price: json['price'] != null
          ? double.tryParse(json['price'].toString())
          : null,
      availableToBook: json['available_to_book'],
      reviews: json['reviews'] ?? [],
      reviewsCount: json['reviews_count'],
      reviewsAvg: (json['reviews_avg'] as num).toDouble(),
      owner: CarOwnerModel.fromJson(json['owner']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'first_image': firstImage,
      'images': images.map((e) => (e as CarImageModel).toJson()).toList(),
      'car_type': carType,
      'brand': (brand as Brand).toJson(),
      'color': (color as ColorInfo).toJson(),
      'car_features': carFeatures
          .map((e) => (e as CarFeature).toJson())
          .toList(),
      'seating_capacity': seatingCapacity,
      'location': (location as LocationInfo).toJson(),
      'average_rate': averageRate,
      'is_for_rent': isForRent,
      'daily_rent': dailyRent,
      'weekly_rent': weeklyRent,
      'monthly_rent': monthlyRent,
      'yearly_rent': yearlyRent,
      'is_for_pay': isForPay,
      'price': price,
      'available_to_book': availableToBook,
      'reviews': reviews,
      'reviews_count': reviewsCount,
      'reviews_avg': reviewsAvg,
    };
  }
}

class CarOwnerModel extends CarOwnerEntity {
  CarOwnerModel({
    required super.id,
    required super.fullName,
    required super.email,
    required super.phone,
    required super.isPhoneVerified,
    required super.country,
    required super.location,
  });

  factory CarOwnerModel.fromJson(dynamic json) {
    if (json is int) {
      return CarOwnerModel(
        id: json,
        fullName: '',
        email: '',
        phone: '',
        isPhoneVerified: false,
        country: CountryModel(id: 0, country: '', abbreviation: ''),
        location: LocationModel(id: 0, name: '', lat: 0.0, lng: 0.0),
      );
    } else if (json is Map<String, dynamic>) {
      // Full object
      return CarOwnerModel(
        id: json['id'],
        fullName: json['full_name'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        isPhoneVerified: json['phone_is_verified'] ?? false,
        country: json['country'] != null
            ? CountryModel.fromJson(json['country'])
            : CountryModel(id: 0, country: '', abbreviation: ''),
        location: json['location'] != null
            ? LocationModel.fromJson(json['location'])
            : LocationModel(id: 0, name: '', lat: 0.0, lng: 0.0),
      );
    } else {
      throw Exception('Invalid owner format');
    }
  }
}

class CarImageModel extends CarImageEntity {
  CarImageModel({required super.id, required super.image});

  factory CarImageModel.fromJson(Map<String, dynamic> json) {
    return CarImageModel(id: json['id'], image: json['image']);
  }

  Map<String, dynamic> toJson() => {'id': id, 'image': image};
}

class Brand extends BrandEntity {
  Brand({required super.id, required super.name, required super.image});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(id: json['id'], name: json['name'], image: json['image']);
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'image': image};
}

class ColorInfo extends ColorInfoEntity {
  ColorInfo({required super.id, required super.name, required super.hexValue});
  factory ColorInfo.fromJson(Map<String, dynamic> json) {
    return ColorInfo(
      id: json['id'],
      name: json['name'],
      hexValue: json['hex_value'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'hex_value': hexValue,
  };
}

class CarFeature extends CarFeatureEntity {
  CarFeature({
    required super.id,
    required super.name,
    required super.value,
    required super.image,
  });
  factory CarFeature.fromJson(Map<String, dynamic> json) {
    return CarFeature(
      id: json['id'],
      name: json['name'],
      value: json['value'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'value': value,
    'image': image,
  };
}

class LocationInfo extends LocationInfoEntity {
  LocationInfo({
    required super.id,
    required super.name,
    required super.lat,
    required super.lng,
  });

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return LocationInfo(
      id: json['id'],
      name: json['name'],
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'lat': lat,
    'lng': lng,
  };
}
