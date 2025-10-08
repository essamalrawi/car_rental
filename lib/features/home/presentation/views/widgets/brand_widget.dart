import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({super.key, required this.brandName, required this.image});
  final String brandName;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          width: 60,

          child: CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(height: 16),
        Text(brandName),
      ],
    );
  }
}
