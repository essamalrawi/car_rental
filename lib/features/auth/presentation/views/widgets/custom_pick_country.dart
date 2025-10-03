import 'package:car_rental/constants/assets.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CustomPickCountry extends StatefulWidget {
  const CustomPickCountry({super.key, this.showCode = false, this.onChanged});

  final bool? showCode;
  final void Function(String?)? onChanged;

  @override
  State<CustomPickCountry> createState() => _CustomPickCountryState();
}

class _CustomPickCountryState extends State<CustomPickCountry> {
  String countryName = "Country";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (countryName == "Country" || countryName.isEmpty) {
          return 'This field is required';
        }
      },
      onTap: () {
        showCountryPicker(
          context: context,
          onSelect: (Country country) {
            countryName = widget.showCode!
                ? "${countryCodeToEmoji(country.countryCode)} ${country.displayName}"
                : country.name;
            widget.onChanged?.call(country.countryCode);
            setState(() {});
          },
        );
      },
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: SizedBox(
          width: 20,
          height: 20,
          child: Center(child: SvgPicture.asset(Assets.imagesIconSwitcherIcon)),
        ),

        hintStyle: TextStyles.regular16.copyWith(
          fontSize: widget.showCode == false ? 14 : 16,
          color: const Color(0xFF7F7F7F),
          letterSpacing: -0.14,
        ),
        hintText: countryName,
        filled: true,
        fillColor: Colors.white,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: 1, color: Color(0xFFD7D7D7)),
    );
  }

  String countryCodeToEmoji(String countryCode) {
    final code = countryCode.toUpperCase();
    return code.runes.map((int rune) {
      return String.fromCharCode(rune + 127397);
    }).join();
  }
}
