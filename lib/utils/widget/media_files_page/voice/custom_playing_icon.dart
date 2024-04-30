import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';

class CustomPlayingIcon extends StatelessWidget {
  const CustomPlayingIcon({super.key, required this.size, required this.icon, required this.onTap});
  final Size size;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
          radius: size.height * .024,
          backgroundColor: Colors.white,
          child: Icon(icon, color: kPrimaryColor, size: size.height * .023)),
    );
  }
}
