import 'package:flutter/material.dart';

PopupMenuItem<dynamic> customPopMenuItemMethod(
    {required Function() onTap,
    required IconData icon,
    required String name,
    required Size size,
    double? angle}) {
  return PopupMenuItem(
      onTap: onTap,
      child: Row(
        children: [
          Transform.rotate(
              angle: angle ?? 0.0,
              child: Icon(icon, size: size.height * .022, color: Colors.white)),
          SizedBox(width: size.width * .04),
          Text(name,
              style:
                  TextStyle(color: Colors.white, fontSize: size.width * .035)),
        ],
      ));
}
