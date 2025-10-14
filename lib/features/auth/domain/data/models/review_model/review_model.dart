import 'package:car_rental/features/auth/domain/entities/reviews_entity.dart';

class CarReviewsModel extends ReviewsEntity {
  CarReviewsModel({
    required super.id,
    required super.username,
    required super.review,
    required super.userImage,
    required super.rate,
  });

  factory CarReviewsModel.fromJson(Map<String, dynamic> json) {
    return CarReviewsModel(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      review: json['review'] ?? '',
      userImage: json['user_image'] ?? '',
      rate: json['rate'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'review': review,
    'user_image': userImage,
    'rate': rate,
  };
}
