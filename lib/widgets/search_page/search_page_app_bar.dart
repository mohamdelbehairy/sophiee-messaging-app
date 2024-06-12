import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../settings/custom_app_bar.dart';
import 'search_page_app_bar_icon.dart';

class SearchPageAppBar extends StatelessWidget {
  const SearchPageAppBar(
      {super.key,
      required this.size,
      required this.controller,
      required this.onTap,
      required this.onChanged});

  final Size size;
  final TextEditingController controller;
  final Function() onTap;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomAppBarSetting(
            size: size,
            controller: controller,
            onTap: onTap,
            hintText: 'Search Friends',
            suffixIcon: controller.text.isNotEmpty ? Icons.close : null,
            onChanged: onChanged,
            widget:
                const Icon(FontAwesomeIcons.barsStaggered, color: Colors.white),
            appParTitle: 'Search',
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            padding: EdgeInsets.only(left: size.height * .035)),
        SearchPageAppBarIcon(size: size),
      ],
    );
  }
}
