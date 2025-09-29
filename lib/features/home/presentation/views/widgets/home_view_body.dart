import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/features/home/presentation/views/widgets/brands_section.dart';
import 'package:car_rental/features/home/presentation/views/widgets/custom_search_bar_button.dart';
import 'package:car_rental/features/home/presentation/views/widgets/filter_search_widget.dart';
import 'package:car_rental/features/home/presentation/views/widgets/notifications_widget.dart';
import 'package:car_rental/features/home/presentation/views/widgets/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 22),
          Row(
            children: [
              SvgPicture.asset(Assets.imagesAuthViewLogo),
              const Spacer(),
              const NotificationsWidget(),
              const SizedBox(width: 15),
              const ProfilePic(),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xffD7D7D7)),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(child: CustomSearchBarButton()),
              SizedBox(width: 26),
              FilterSearchWidget(),
            ],
          ),

          const SizedBox(height: 28),
          const BrandsSection(),
        ],
      ),
    );
  }
}
