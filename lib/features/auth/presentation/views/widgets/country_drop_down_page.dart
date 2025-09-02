import 'package:flutter/material.dart';
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CountryDropdownPage extends StatefulWidget {
  const CountryDropdownPage({super.key});

  @override
  State<CountryDropdownPage> createState() => _CountryDropdownPageState();
}

class _CountryDropdownPageState extends State<CountryDropdownPage> {
  String? selectedCountry;

  final List<String> countries = [
    "USA",
    "UK",
    "Canada",
    "France",
    "Germany",
    "Egypt",
    "Morocco",
    "Japan",
    "China",
    "Brazil",
    "Argentina",
    "Spain",
    "Italy",
    "Turkey",
    "India",
    "Saudi Arabia",
    "Qatar",
    "Kuwait",
    "Oman",
    "Bahrain",
  ];

  final Map<String, String> countryFlags = {
    "USA": "🇺🇸",
    "UK": "🇬🇧",
    "Canada": "🇨🇦",
    "France": "🇫🇷",
    "Germany": "🇩🇪",
    "Egypt": "🇪🇬",
    "Morocco": "🇲🇦",
    "Japan": "🇯🇵",
    "China": "🇨🇳",
    "Brazil": "🇧🇷",
    "Argentina": "🇦🇷",
    "Spain": "🇪🇸",
    "Italy": "🇮🇹",
    "Turkey": "🇹🇷",
    "India": "🇮🇳",
    "Saudi Arabia": "🇸🇦",
    "Qatar": "🇶🇦",
    "Kuwait": "🇰🇼",
    "Oman": "🇴🇲",
    "Bahrain": "🇧🇭",
  };

  static const int pageSize = 8;

  Future<List<MenuItemModel<String>>> _page(
    int page,
    String? searchText,
  ) async {
    await Future.delayed(const Duration(milliseconds: 120)); // optional
    final q = (searchText ?? '').toLowerCase();
    final filtered = countries
        .where((c) => q.isEmpty || c.toLowerCase().contains(q))
        .toList();

    final start = page * pageSize;
    if (start >= filtered.length) return [];

    final end = (start + pageSize > filtered.length)
        ? filtered.length
        : start + pageSize;

    return filtered.sublist(start, end).map((name) {
      return MenuItemModel<String>(
        value: name,
        label: name,
        child: Row(
          children: [
            Text(
              countryFlags[name] ?? "🏳️",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 8),
            Text(name),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: HighQPaginatedDropdown<String>.paginated(
        requestItemCount: pageSize,
        backgroundDecoration: (child) => InputDecorator(
          decoration: InputDecoration(
            hintStyle: TextStyles.regular14.copyWith(
              color: const Color(0xFF7F7F7F),
              letterSpacing: -0.14,
            ),
            filled: true,
            fillColor: Colors.white,
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
          ),
          child: child,
        ),
        hintText: const Text('🇵🇸 Country'),

        paginatedRequest: _page,
        onChanged: (val) => setState(() => selectedCountry = val),
        hasTrailingClearIcon: true,
        padding: EdgeInsets.zero,
        showTextField: false,
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: 1, color: Color(0xFFD7D7D7)),
    );
  }
}
