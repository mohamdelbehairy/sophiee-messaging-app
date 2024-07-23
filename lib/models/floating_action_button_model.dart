import 'package:flutter/material.dart';

class FloatingActionButtonModel {
  final IconData icon;
  final String heroTag;
  final Function() onTap;
  final bool isDark;

  FloatingActionButtonModel(
      {required this.icon,
      required this.heroTag,
      required this.onTap,
      required this.isDark});
}
