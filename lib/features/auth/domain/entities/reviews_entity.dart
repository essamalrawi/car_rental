class ReviewsEntity {
  final int id;
  final String username;
  final String review;
  final String userImage;
  final int rate;

  ReviewsEntity({
    required this.id,
    required this.username,
    required this.review,
    required this.userImage,
    required this.rate,
  });
}
