import 'package:flutter/material.dart';

class MyFriendIconModel {
  final double? right, left, size;
  final IconData icon;
  final Function() onPressed;

  MyFriendIconModel(
      {this.right,
      this.left,
      this.size,
      required this.icon,
      required this.onPressed});
}
