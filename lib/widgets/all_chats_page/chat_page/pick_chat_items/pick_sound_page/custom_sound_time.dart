import 'package:flutter/material.dart';

class CustomSoundTime extends StatelessWidget {
  const CustomSoundTime(
      {super.key,
      required this.size,
      required this.positionBottom,
      this.positionLeft,
      this.positionRight,
      required this.soundText});
  final Size size;
  final double positionBottom;
  final double? positionLeft;
  final double? positionRight;
  final String soundText;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: positionBottom,
      left: positionLeft,
      right: positionRight,
      child: Text(soundText, style: TextStyle(fontSize: size.width * .02)),
    );
  }
}
