import 'package:car_rental/constants/assets.dart';
import 'package:car_rental/core/utils/app_text_styles.dart';
import 'package:car_rental/features/home/presentation/views/widgets/car_brand_selector.dart';
import 'package:car_rental/features/home/presentation/views/widgets/custom_search_bar_button.dart';
import 'package:car_rental/features/home/presentation/views/widgets/custom_search_view_app_bar.dart';
import 'package:car_rental/features/home/presentation/views/widgets/filter_search_widget.dart';
import 'package:car_rental/features/home/presentation/views/widgets/recommend_car_card.dart';
import 'package:car_rental/features/home/presentation/views/widgets/section_header_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 24),
                CustomSearchViewAppBar(),

                SizedBox(height: 20),

                Divider(color: Color(0xffD7D7D7)),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: CustomSearchBarButton()),
                    SizedBox(width: 26),
                    IconHolder(iconImage: Assets.imagesIconFilterIcon),
                  ],
                ),
                SizedBox(height: 28),

                CarBrandSelector(),
                SizedBox(height: 28),
                SectionHeaderRow(text: "Recommend For You"),
                SizedBox(height: 18),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 200 / 279,
            ),
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return const RecommendCarCard();
            }, childCount: 4),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 28)),
          const SliverToBoxAdapter(
            child: SectionHeaderRow(text: "Our Popular Cars"),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 18)),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(right: 18.0),
                    child: PopularCarContianer(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopularCarContianer extends StatelessWidget {
  const PopularCarContianer({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 256 / 100,
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFFEDEDED),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFD7D7D7)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SizedBox(
                width: 118,
                child: AspectRatio(
                  aspectRatio: 118 / 67,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Image.asset(Assets.imagesTestCar),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      'Ferrari LaFerrari',
                      style: TextStyles.regular14.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '5.0',
                          style: TextStyles.semibold30.copyWith(
                            color: const Color(0xFF7F7F7F),
                            fontSize: 12,
                            height: 1.17,
                            letterSpacing: 0.12,
                          ),
                        ),
                        const SizedBox(width: 5),
                        SvgPicture.asset(Assets.imagesIconStar),
                      ],
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '\$100/Day',
                      style: TextStyles.regular14.copyWith(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
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
