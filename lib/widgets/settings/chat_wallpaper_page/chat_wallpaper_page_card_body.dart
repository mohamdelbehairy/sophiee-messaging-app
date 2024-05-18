import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';
import '../../../models/setting_card_model.dart';
import '../card_body_details.dart';

class ChatWallPaperPageCardBody extends StatelessWidget {
  const ChatWallPaperPageCardBody(
      {super.key, required this.size, required this.isDark});
  final Size size;
  final bool isDark;

  static List<SettingCardModel> items = [
    SettingCardModel(
        icon: Icons.add_a_photo_outlined,
        text: 'Upload Wallpaper',
        color: Colors.indigoAccent.shade400,
        onTap: () {}),
    SettingCardModel(
        icon: Icons.colorize_outlined,
        text: 'Set a color',
        color: Colors.pink.shade400,
        onTap: () {}),
    SettingCardModel(
        icon: FontAwesomeIcons.star,
        text: 'Reset to Defaults',
        color: const Color(0xffB338E0),
        onTap: () {})
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? cardDarkModeBackground : Colors.white,
      elevation: isDark ? 1 : 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 4),
          child: CardBodyDetails(items: items, size: size, isDark: isDark)),
    );
  }
}
