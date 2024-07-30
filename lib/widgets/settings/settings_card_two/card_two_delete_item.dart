import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/widgets/settings/custom_items_two.dart';

class CardTwoDeleteItem extends StatelessWidget {
  const CardTwoDeleteItem({super.key, required this.size, required this.onTap});

  final Size size;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CustomItemsTwo(
        onTap: onTap,
        size: size,
        textColor: const Color(0xfffe6e6e),
        icon2: FontAwesomeIcons.chevronRight,
        text: 'Delete Account',
        iconSize: size.width * .04,
        icon: Icons.person,
        color: const Color(0xfffe6e6e));
  }
}
