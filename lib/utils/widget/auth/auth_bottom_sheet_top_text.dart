import 'package:flutter/material.dart';

class AuthBottomSheetTopText extends StatelessWidget {
  const AuthBottomSheetTopText(
      {super.key, required this.isDark, required this.text});

  final bool isDark;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: isDark ? Colors.white : Colors.black));
  }
}
