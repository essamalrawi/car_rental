import 'package:car_rental/constants/assets.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.backgroundImage,
    this.subtitle,
    required this.title,
  });

  final String backgroundImage;
  final String? subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: false,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 65,
                          width: 65,
                          child: Image.asset(
                            Assets.imagesLogo,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 48),
                      ],
                    ),
                  ),

                  Text(
                    title,
                    style: TextStyles.semibold40.copyWith(color: Colors.white),
                  ),
                ],
              ),
              Spacer(),

              subtitle != null && subtitle!.isNotEmpty
                  ? Text(
                      subtitle!,
                      style: TextStyles.regular16.copyWith(color: Colors.white),
                    )
                  : const SizedBox(),

              SizedBox(height: 55),

              SizedBox(height: 40),
              Visibility(
                visible: false,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Column(
                  children: [
                    CustomButton(text: "Get Started"),
                    SizedBox(height: 55),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
