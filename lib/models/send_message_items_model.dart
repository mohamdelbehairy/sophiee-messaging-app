import 'package:flutter/material.dart';

class SendMessageItemdModel {
  final String itemName;
  final IconData iconData;
  final Color backgroundIconColor;
  double iconSize;
  final Function() onPressed;

  SendMessageItemdModel({
    required this.itemName,
    required this.iconData,
    required this.backgroundIconColor,
    this.iconSize = 30,
    required this.onPressed,
  });
}
