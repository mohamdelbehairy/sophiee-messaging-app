import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';
import '../custom_items_two.dart';
import 'chat_wall_paper_set_color.dart';
import 'reset_defaults.dart';

class ChatWallPaperPageCardBody extends StatelessWidget {
  const ChatWallPaperPageCardBody(
      {super.key, required this.size, required this.isDark});
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? cardDarkModeBackground : Colors.white,
      elevation: isDark ? 1 : 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 4),
          child: Column(
            children: [
              CustomItemsTwo(
                  color: Colors.indigoAccent.shade400,
                  icon: Icons.add_a_photo_outlined,
                  icon2: FontAwesomeIcons.chevronRight,
                  iconSize: size.width * .045,
                  text: 'Upload Wallpaper',
                  size: size,
                  textColor: isDark ? Colors.white : Colors.black,
                  onTap: () {}),
              const SizedBox(height: 4),
              ChatWallPaperSetColor(size: size, isDark: isDark),
              const SizedBox(height: 4),
              ChatWallPaperResetDefaults(size: size, isDark: isDark)
            ],
          )),
    );
  }
}

