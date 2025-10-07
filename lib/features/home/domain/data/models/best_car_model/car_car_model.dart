class CarModel {
  final int id;
  final String name;
  final String description;
  final String firstImage;
  final List<CarImage> images;
  final String carType;
  final Brand brand;
  final ColorInfo color;
  final List<CarFeature> carFeatures;
  final String seatingCapacity;
  final LocationInfo location;
  final double averageRate;
  final bool isForRent;
  final String dailyRent;
  final String weeklyRent;
  final String monthlyRent;
  final String yearlyRent;
  final bool isForPay;
  final double? price;
  final bool availableToBook;
  final List<dynamic> reviews;
  final int reviewsCount;
  final double reviewsAvg;

  CarModel({
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
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      firstImage: json['first_image'],
      images: (json['images'] as List)
          .map((e) => CarImage.fromJson(e))
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
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      availableToBook: json['available_to_book'],
      reviews: json['reviews'] ?? [],
      reviewsCount: json['reviews_count'],
      reviewsAvg: (json['reviews_avg'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'first_image': firstImage,
      'images': images.map((e) => e.toJson()).toList(),
      'car_type': carType,
      'brand': brand.toJson(),
      'color': color.toJson(),
      'car_features': carFeatures.map((e) => e.toJson()).toList(),
      'seating_capacity': seatingCapacity,
      'location': location.toJson(),
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

class CarImage {
  final int id;
  final String image;

  CarImage({required this.id, required this.image});

  factory CarImage.fromJson(Map<String, dynamic> json) {
    return CarImage(id: json['id'], image: json['image']);
  }

  Map<String, dynamic> toJson() => {'id': id, 'image': image};
}

class Brand {
  final int id;
  final String name;
  final String image;

  Brand({required this.id, required this.name, required this.image});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(id: json['id'], name: json['name'], image: json['image']);
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'image': image};
}

class ColorInfo {
  final int id;
  final String name;
  final String hexValue;

  ColorInfo({required this.id, required this.name, required this.hexValue});

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

class CarFeature {
  final int id;
  final String name;
  final String value;
  final String image;

  CarFeature({
    required this.id,
    required this.name,
    required this.value,
    required this.image,
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

class LocationInfo {
  final int id;
  final String name;
  final double lat;
  final double lng;

  LocationInfo({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
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
