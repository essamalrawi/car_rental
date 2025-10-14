import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactCardRow extends StatelessWidget {
  const ContactCardRow({super.key, required this.name, required this.image});
  final String name, image;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: const Color(0xffD7D7D7)),
              ),
              child: ClipOval(
                child: SizedBox(
                  width: 54,
                  height: 54,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 18),
            Text(
              name,
              style: TextStyles.regular14.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(width: 15, height: 15, Assets.imagesIconVerifited),
          ],
        ),
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                border: Border.all(width: 1, color: const Color(0xffD7D7D7)),
              ),

              child: Center(child: SvgPicture.asset(Assets.imagesIconPhone)),
            ),
            const SizedBox(width: 18),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                border: Border.all(width: 1, color: const Color(0xffD7D7D7)),
              ),

              child: Center(child: SvgPicture.asset(Assets.imagesIconMessage)),
            ),
          ],
        ),
      ],
    );
  }
}
