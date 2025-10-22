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
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 24),
                const CustomSearchViewAppBar(),

                const SizedBox(height: 20),

                const Divider(color: Color(0xffD7D7D7)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(child: CustomSearchBarButton()),
                    const SizedBox(width: 26),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor:
                              Colors.transparent, // for rounded corners effect
                          builder: (BuildContext context) {
                            return SafeArea(
                              top:
                                  false, // allow it to go to top if you want, set true to avoid
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height *
                                    0.95, // slightly smaller than full screen
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                child: const Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Text(
                                      'Bottom Sheet without covering phone bars',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    // Your content goes here
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const IconHolder(
                        iconImage: Assets.imagesIconFilterIcon,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),

                const CarBrandSelector(),
                const SizedBox(height: 28),
                const SectionHeaderRow(text: "Recommend For You"),
                const SizedBox(height: 18),
              ],
            ),
          ),

          // SliverGrid(
          //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //     maxCrossAxisExtent: 200.0,
          //     mainAxisSpacing: 10.0,
          //     crossAxisSpacing: 10.0,
          //     childAspectRatio: 200 / 279,
          //   ),
          //   delegate: SliverChildBuilderDelegate((
          //     BuildContext context,
          //     int index,
          //   ) {
          //     return const RecommendCarCard();
          //   }, childCount: 4),
          // ),
          // const SliverToBoxAdapter(child: SizedBox(height: 28)),
          // const SliverToBoxAdapter(
          //   child: SectionHeaderRow(text: "Our Popular Cars"),
          // ),

          // const SliverToBoxAdapter(child: SizedBox(height: 18)),

          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 100,
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 3,
          //       itemBuilder: (context, index) {
          //         return const Padding(
          //           padding: EdgeInsets.only(right: 18.0),
          //           child: PopularCarContianer(),
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
