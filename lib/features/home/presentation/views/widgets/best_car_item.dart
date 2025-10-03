import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BestCarItem extends StatefulWidget {
  const BestCarItem({super.key});

  @override
  State<BestCarItem> createState() => _BestCarItemState();
}

class _BestCarItemState extends State<BestCarItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 186 / 269,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF0F0F0),

          border: Border.all(width: 1, color: const Color(0xffD7D7D7)),
          borderRadius: BorderRadius.circular(15),
        ),

        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 124,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.imagesTestWhiteFerrariFfCar),
                    ),
                  ),
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
                      "Dummy model-FF",
                      style: TextStyles.semibold30.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text("5.0"),
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
                          "Washington DC",
                          style: TextStyles.regular14.copyWith(fontSize: 12),
                        ),
                      ],
                    ),

                    const SizedBox(height: 11),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Assets.imagesIconSeet),
                            const SizedBox(width: 5),
                            Text(
                              "4 seats",
                              style: TextStyles.semibold30.copyWith(
                                fontSize: 12,
                                color: const Color(0xff7F7F7F),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(Assets.imagesIconCurrency),
                                const SizedBox(width: 5),
                                Text(
                                  "\$200/Day",
                                  style: TextStyles.semibold30.copyWith(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 11),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
