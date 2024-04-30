import 'package:flutter/material.dart';

PopupMenuItem<dynamic> groupsInfoPopMenuItem(
    {required Function() onTap, required String itemName, required Size size}) {
  return PopupMenuItem(
    onTap: onTap,
    child: Text(
      itemName,
      style: TextStyle(
          fontWeight: FontWeight.w100,
          color: Colors.white,
          fontSize: size.width * .04),
    ),
  );
}
