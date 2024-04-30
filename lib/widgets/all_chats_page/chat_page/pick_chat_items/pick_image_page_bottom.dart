import 'package:flutter/material.dart';

class PickImagePageBottom extends StatelessWidget {
  const PickImagePageBottom(
      {super.key,
      required this.color,
      required this.onTap,
      required this.icon});
  final Color color;
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: color,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
