import 'package:car_rental/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 76,
        decoration: BoxDecoration(
          color: const Color(0xff21292B),
          borderRadius: BorderRadius.circular(54),
        ),

        child: Row(
          children: bottomNavigationBarItems.asMap().entries.map((e) {
            var index = e.key;
            var entity = e.value;

            return Expanded(
              flex: index == selectedIndex ? 3 : 2,
              child: GestureDetector(
                onTap: () {
                  selectedIndex = index;
                  widget.onItemTapped(index);
                  setState(() {});
                },
                child: selectedIndex == index
                    ? SvgPicture.asset(entity.activeImage)
                    : SvgPicture.asset(entity.inActiveImage),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
