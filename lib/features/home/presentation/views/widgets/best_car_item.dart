import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BestCarItem extends StatefulWidget {
  const BestCarItem({super.key, required this.car});
  final CarEntity car;
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
                SizedBox(
                  height: 124,

                  child: CachedNetworkImage(
                    imageUrl: widget.car.images.first.image,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
                      widget.car.name,
                      style: TextStyles.semibold30.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text("${widget.car.averageRate}"),
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
                          widget.car.location.name,
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
                              "${widget.car.seatingCapacity} Seats",
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
                                  maxLines: 1,
                                  "\$${widget.car.price?.toDouble().toStringAsFixed(1) ?? '0.0'}/Day",
                                  overflow: TextOverflow.ellipsis,
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
