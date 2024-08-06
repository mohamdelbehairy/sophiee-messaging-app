import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowChatMediaAppBarPopMenu extends StatelessWidget {
  const ShowChatMediaAppBarPopMenu(
      {super.key, required this.saveOnTap, required this.shareOnTap});

  final Function() saveOnTap;
  final Function() shareOnTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopupMenuButton(
      color: kPrimaryColor,
      offset: const Offset(0, 50),
      itemBuilder: (context) => [
        PopupMenuItem(
            onTap: saveOnTap,
            child: Row(
              children: [
                Icon(Icons.bookmark_add,
                    size: size.width * .05, color: Colors.white),
                SizedBox(width: size.width * .04),
                const Text("Save", style: TextStyle(color: Colors.white)),
              ],
            )),
        PopupMenuItem(
            onTap: shareOnTap,
            child: Row(
              children: [
                Icon(FontAwesomeIcons.share,
                    size: size.height * .018, color: Colors.white),
                SizedBox(width: size.width * .04),
                const Text("Share", style: TextStyle(color: Colors.white)),
              ],
            )),
      ],
    );
  }
}
