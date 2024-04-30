import 'package:flutter/material.dart';

class AuthPositionedIcon extends StatelessWidget {
  const AuthPositionedIcon(
      {super.key,
      required this.top,
      this.left,
      this.right,
      required this.onPressed,
      required this.child});
  final double top;
  final double? left;
  final double? right;
  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        right: right,
        left: left,
        child: TextButton(onPressed: onPressed, child: child));
  }
}
