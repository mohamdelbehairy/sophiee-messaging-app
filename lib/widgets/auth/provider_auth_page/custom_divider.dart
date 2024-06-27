import 'package:flutter/material.dart';

class ProviderAuthPageCustomDivider extends StatelessWidget {
  const ProviderAuthPageCustomDivider(
      {super.key, required this.size, required this.left, required this.right});

  final Size size;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1,
        width: size.width * .36,
        margin: EdgeInsets.only(left: left, right: right),
        decoration: BoxDecoration(color: Colors.white.withOpacity(.3)));
  }
}