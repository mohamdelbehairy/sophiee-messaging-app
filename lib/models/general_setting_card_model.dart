import 'package:flutter/material.dart';

class GeneralSettingCardModel {
  final IconData icon;
  final String text;
  final Color color;
  final Function() onTap;

  const GeneralSettingCardModel(
      {required this.icon, required this.text, required this.color,required this.onTap});
}
