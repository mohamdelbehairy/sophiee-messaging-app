import 'package:flutter/material.dart';

class CustomTextTitleSwitch extends StatelessWidget {
  const CustomTextTitleSwitch(
      {super.key,
      required this.isDark,
      required this.size,
      required this.title});

  final bool isDark;
  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.w100,
            fontSize: size.height * .022));
  }
}
