import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarDetailsSlider extends StatefulWidget {
  const CarDetailsSlider({super.key, required this.images});
  final List<CarImageEntity> images;
  @override
  CarDetailsSliderState createState() => CarDetailsSliderState();
}

class CarDetailsSliderState extends State<CarDetailsSlider> {
  int _currentIndex = 0;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 260.0,
                autoPlay: false,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: widget.images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return CachedNetworkImage(
                      imageUrl: image.image,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.images.asMap().entries.map((entry) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? const Color(0xff454545)
                        : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        Positioned(
          right: 20,
          top: 20,

          child: GestureDetector(
            onTap: () {
              isFavorite = !isFavorite;
              setState(() {});
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: const Color(0xffD7D7D7)),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsetsGeometry.all(10),
                child: isFavorite
                    ? SvgPicture.asset(Assets.imagesIconFillHeart)
                    : SvgPicture.asset(Assets.imagesIconHeart),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
