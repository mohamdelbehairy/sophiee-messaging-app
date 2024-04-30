import 'package:sophiee/models/message_model.dart';
import 'package:flutter/material.dart';

class CustomMessageAudioIcon extends StatelessWidget {
  const CustomMessageAudioIcon(
      {super.key,
      required this.size,
      required this.message,
      required this.onTap,
      required this.icon,
      required this.backgroungColor,
      required this.iconColor, required this.iconSize});

  final Size size;
  final MessageModel message;
  final Function() onTap;
  final IconData icon;
  final Color backgroungColor;
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: size.height * .02,
        backgroundColor: backgroungColor,
        child: GestureDetector(
          onTap: onTap,
          child: Icon(icon, color: iconColor, size: iconSize),
        ));
  }
}
