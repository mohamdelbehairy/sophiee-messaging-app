import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GroupsChatComponent extends StatelessWidget {
  const GroupsChatComponent(
      {super.key, required this.componentName, required this.onTap});
  final String componentName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
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
                        color: Colors.black,
                        fontSize: size.height * .02,
                        fontWeight: FontWeight.normal)),
                Icon(FontAwesomeIcons.play,
                    color: Colors.grey, size: size.height * .015)
              ],
            ),
          ),
        ),
        Divider(thickness: 2, color: Colors.grey.withOpacity(.1)),
      ],
    );
  }
}
