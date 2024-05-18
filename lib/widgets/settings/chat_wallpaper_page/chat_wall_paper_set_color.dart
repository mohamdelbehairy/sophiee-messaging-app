import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../custom_items_two.dart';
import 'set_color_body.dart';

class ChatWallPaperSetColor extends StatefulWidget {
  const ChatWallPaperSetColor(
      {super.key, required this.size, required this.isDark});

  final Size size;
  final bool isDark;

  @override
  State<ChatWallPaperSetColor> createState() => _ChatWallPaperSetColorState();
}

class _ChatWallPaperSetColorState extends State<ChatWallPaperSetColor> {
  Color pickerColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return CustomItemsTwo(
        color: Colors.pink.shade400,
        icon: Icons.colorize_outlined,
        icon2: FontAwesomeIcons.chevronRight,
        iconSize: widget.size.width * .045,
        text: 'Set a color',
        size: widget.size,
        textColor: widget.isDark ? Colors.white : Colors.black,
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return SetColorBody(
                  pickerColor: pickerColor,
                  onColorChanged: (value) {
                    setState(() {
                      pickerColor = value;
                    });
                  },
                );
              });
        });
  }
}
