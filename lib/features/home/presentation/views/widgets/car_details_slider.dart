import 'package:car_rental/constants/assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarDetailsSlider extends StatefulWidget {
  const CarDetailsSlider({super.key});

  @override
  _CarDetailsSliderState createState() => _CarDetailsSliderState();
}

class _CarDetailsSliderState extends State<CarDetailsSlider> {
  final List<String> images = [
    Assets.imagesTestCar,
    Assets.imagesTestCar,
    Assets.imagesTestCar,
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          items: images.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(image);
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
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
    );
  }
}
