import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GroupsChatComponent extends StatelessWidget {
  const GroupsChatComponent(
      {super.key,
      required this.componentName,
      required this.onTap,
      required this.size,
      required this.isDark});
  final String componentName;
  final Function() onTap;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * .012, horizontal: size.width * .04),
            child: GestureDetector(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(componentName,
                      style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                          fontSize: size.height * .02,
                          fontWeight: FontWeight.w300)),
                  Icon(FontAwesomeIcons.play,
                      color: isDark ? Colors.white70 : Colors.grey,
                      size: size.height * .015)
                ],
              ),
            ),
          ),
          Divider(thickness: 2, color: Colors.grey.withValues(alpha: .1)),
        ],
      ),
    );
  }
}
