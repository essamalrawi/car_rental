import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:car_rental/features/auth/domain/entities/reviews_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});
  final ReviewsEntity review;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 243 / 90,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xffD7D7D7)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                width: 1,
                                color: Color(0xFFD7D7D7),
                              ),
                            ),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: review.userImage,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        review.username,
                        style: TextStyles.regular14.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        review.rate.toString(),
                        style: TextStyles.bold18.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          height: 1.21,
                          letterSpacing: 0.14,
                        ),
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset(Assets.imagesIconStar),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Text(
                textAlign: TextAlign.left,
                maxLines: 2, // limit lines to fit card
                overflow: TextOverflow.ellipsis,
                review.review,
                style: TextStyles.regular14.copyWith(
                  color: const Color(0xFF7F7F7F),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
