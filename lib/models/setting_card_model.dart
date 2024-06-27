import 'package:flutter/material.dart';

class SettingCardModel {
  final IconData icon;
  final String text;
  final Color color;
  final Function() onTap;

  const SettingCardModel(
      {required this.icon,
      required this.text,
      required this.color,
      required this.onTap});
}
