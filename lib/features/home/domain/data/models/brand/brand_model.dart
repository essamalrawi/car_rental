import 'package:car_rental/features/home/domain/entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  BrandModel({required super.id, required super.name, required super.image});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(id: json['id'], name: json['name'], image: json['image']);
  }
}
