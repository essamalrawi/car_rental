import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/features/home/domain/entities/car_entity.dart';
import 'package:car_rental/features/home/presentation/views/car_details.dart';
import 'package:flutter/material.dart';

class NearbyCar extends StatelessWidget {
  const NearbyCar({super.key, required this.car});
  final CarEntity car;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Nearby"), Text("View All")],
        ),
        const SizedBox(height: 18),
        Container(
          width: double.infinity,

          decoration: BoxDecoration(
            color: const Color(0xffF0F0F0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            height: 121,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.sizeOf(context).width * .1,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CarDetails.routeName,
                    arguments: car.id,
                  );
                },
                child: CachedNetworkImage(
                  imageUrl: car.images[1].image,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
