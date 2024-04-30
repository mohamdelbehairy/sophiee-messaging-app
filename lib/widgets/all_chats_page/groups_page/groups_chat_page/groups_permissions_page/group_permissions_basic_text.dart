import 'package:flutter/material.dart';

class GroupPermissionsBasicText extends StatelessWidget {
  const GroupPermissionsBasicText(
      {super.key,
      required this.isDark,
      required this.size,
      required this.basicText});

  final bool isDark;
  final Size size;
  final String basicText;

  @override
  Widget build(BuildContext context) {
    return Text(basicText,
        style: TextStyle(
            color: isDark ? Colors.grey.shade300 : Colors.grey,
            fontSize: size.height * .018,
            fontWeight: FontWeight.w100));
  }
}
