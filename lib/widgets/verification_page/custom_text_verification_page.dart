import 'package:flutter/material.dart';

class CustomTextVerificationPage extends StatelessWidget {
  const CustomTextVerificationPage(
      {super.key,
      required this.fontSize,
      required this.text,
      required this.fontWeight,
      required this.color});

  final double fontSize;
  final String text;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }
}
