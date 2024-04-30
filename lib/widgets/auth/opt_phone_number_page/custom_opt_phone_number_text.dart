import 'package:flutter/material.dart';

class CustomOptPhoneNumbertext extends StatelessWidget {
  const CustomOptPhoneNumbertext(
      {super.key,
      required this.size,
      required this.text,
      required this.textColor,
      required this.textSize});

  final Size size;
  final String text;
  final Color textColor;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: textSize, color: textColor));
  }
}
