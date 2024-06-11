import 'package:flutter/material.dart';

class CustomMediumItemShimmer extends StatelessWidget {
  const CustomMediumItemShimmer(
      {super.key,
      required this.borderRadius,
      required this.alignment,
      required this.width,
      required this.size});
  final BorderRadius borderRadius;
  final Alignment alignment;
  final double width;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: alignment,
        child: Container(
            height: size.height * .05,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: borderRadius)));
  }
}
