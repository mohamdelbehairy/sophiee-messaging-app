import 'package:flutter/material.dart';

PopupMenuItem<dynamic> groupsInfoPopMenuItem(
    {required Function() onTap,
    required String itemName,
    required Size size,
    IconData? icon}) {
  return PopupMenuItem(
    onTap: onTap,
    child: Row(
      children: [
        if (icon != null)
          Icon(icon, color: Colors.white, size: size.width * .04),
        if (icon != null) SizedBox(width: size.width * .03),
        Text(
          itemName,
          style: TextStyle(
              fontWeight: FontWeight.w100,
              color: Colors.white,
              fontSize: icon != null ? size.width * .035 : size.width * .04),
        ),
      ],
    ),
  );
}
