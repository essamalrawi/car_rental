import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecommendCarCard extends StatefulWidget {
  const RecommendCarCard({super.key});

  @override
  State<RecommendCarCard> createState() => _RecommendCarCardState();
}

class _RecommendCarCardState extends State<RecommendCarCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF0F0F0),

        border: Border.all(width: 1, color: const Color(0xffD7D7D7)),
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                child: Image.asset(Assets.imagesTestCar),
                // child: CachedNetworkImage(
                //   imageUrl: widget.car.images.first.image,
                //   placeholder: (context, url) =>
                //       const Center(child: CircularProgressIndicator()),
                //   errorWidget: (context, url, error) =>
                //       const Icon(Icons.error),
                // ),
              ),
              Positioned(
                right: 10,
                top: 10,

                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: const Color(0xffD7D7D7),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      isFavorite = !isFavorite;
                      setState(() {});
                    },
                    child: Center(
                      child: isFavorite
                          ? SvgPicture.asset(Assets.imagesIconFillHeart)
                          : SvgPicture.asset(Assets.imagesIconHeart),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            height: 143,

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Text(
                    // widget.car.name,
                    "Tesla Air glass",
                    style: TextStyles.semibold30.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        // "${widget.car.averageRate}"
                        "5.5",
                      ),

                      const SizedBox(width: 5),
                      SvgPicture.asset(
                        width: 12,
                        height: 12,
                        Assets.imagesIconStar,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      SvgPicture.asset(
                        width: 12,
                        height: 12,
                        Assets.imagesIconLocation,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        //  widget.car.location.name,
                        "idk care",
                        style: TextStyles.regular14.copyWith(fontSize: 12),
                      ),
                    ],
                  ),

                  const SizedBox(height: 11),
                  Row(
                    children: [
                      const Text(
                        "\$100/Day",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      const Spacer(),
                      SizedBox(
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF21292B),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                          ),
                          child: const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "Book now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
