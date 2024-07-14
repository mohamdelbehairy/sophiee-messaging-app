import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/setting_card_model.dart';
import 'custom_items_two.dart';

class CardBodyDetails extends StatelessWidget {
  const CardBodyDetails(
      {super.key,
      required this.items,
      required this.size,
      required this.isDark});

  final List<SettingCardModel> items;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.asMap().entries.map((e) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: e.key == 1 ? 4 : 0),
            child: CustomItemsTwo(
                color: e.value.color,
                icon: e.value.icon,
                icon2: FontAwesomeIcons.chevronRight,
                iconSize: e.key == 2
                    ? size.width * .04
                    : e.key == 3
                        ? size.width * .035
                        : size.width * .045,
                text: e.value.text,
                size: size,
                textColor: isDark ? Colors.white : Colors.black,
                onTap: e.value.onTap));
      }).toList(),
    );
  }
}
