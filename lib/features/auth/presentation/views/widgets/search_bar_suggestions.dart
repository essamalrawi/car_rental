import 'package:car_rental/features/auth/cubits/get_countries/get_countries_cubit.dart';
import 'package:car_rental/features/auth/domain/entities/country_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBarSuggestions extends StatefulWidget {
  const SearchBarSuggestions({super.key, this.onSaved});
  final void Function(int?)? onSaved;
  @override
  State<SearchBarSuggestions> createState() => _SearchBarSuggestionsState();
}

class _SearchBarSuggestionsState extends State<SearchBarSuggestions> {
  List<CountryEntity> _data = [];

  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _controller = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  String _query = "";

  void _showOverlay(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        final filtered = _data
            .where(
              (item) =>
                  item.country.toLowerCase().contains(_query.toLowerCase()),
            )
            .toList();

        if (_query.isEmpty || filtered.isEmpty) return const SizedBox.shrink();

        return Positioned(
          width: MediaQuery.of(context).size.width - 32,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: const Offset(0, 60),
            // TextField height (50) + 4 margin
            child: Material(
              color: Colors.white,
              elevation: 6,
              borderRadius: BorderRadius.circular(10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) =>
                      const Divider(height: 1, color: Color(0xFFD7D7D7)),
                  itemBuilder: (context, index) {
                    final suggestion = filtered[index];
                    return ListTile(
                      dense: true,
                      title: Text(
                        "${countryCodeToEmoji(suggestion.abbreviation)} ${suggestion.country} ",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333333),
                        ),
                      ),
                      onTap: () {
                        _controller.text = suggestion.country;
                        widget.onSaved?.call(suggestion.id);
                        _query = "";
                        _removeOverlay();
                        setState(() {});
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetCountriesCubit, GetCountriesState>(
      listener: (context, state) {
        if (state is GetCountriesSuccess) {
          _data = state.countries;
          print(_data.length);
        }
      },
      child: Column(
        children: [
          CompositedTransformTarget(
            link: _layerLink,
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                suffixIcon: SizedBox(
                  width: 20,
                  height: 20,
                  child: Center(
                    child: SvgPicture.asset("assets/images/switcher_icon.svg"),
                  ),
                ),
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7F7F7F),
                  letterSpacing: -0.14,
                ),
                hintText: "Country",
                filled: true,
                fillColor: Colors.white,
                border: buildBorder(),
                enabledBorder: buildBorder(),
                focusedBorder: buildBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _query = value;
                });
                _removeOverlay();
                _showOverlay(context);
              },
            ),
          ),
        ],
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
