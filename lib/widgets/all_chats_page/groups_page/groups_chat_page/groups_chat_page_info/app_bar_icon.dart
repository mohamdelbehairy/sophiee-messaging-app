import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon(
      {super.key,
      required this.icon,
      required this.onTap,
      this.padding = 0,
      required this.iconsSize});
  final IconData icon;
  final Function() onTap;
  final double padding;
  final double iconsSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: GestureDetector(
          onTap: onTap,
          child: Icon(icon, color: Colors.white, size: iconsSize)),
    );
  }
}
