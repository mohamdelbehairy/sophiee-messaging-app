import 'package:flutter/material.dart';

class CustomMediumItemShimmer extends StatelessWidget {
  const CustomMediumItemShimmer({super.key, required this.borderRadius, required this.alignment, required this.width});
  final BorderRadius borderRadius;
  final Alignment alignment;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:alignment,
      child: Container(
        height: 45,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
