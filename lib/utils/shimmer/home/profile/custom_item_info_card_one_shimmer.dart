import 'package:flutter/material.dart';

class CustomItemInfoCardOneShimmer extends StatelessWidget {
  const CustomItemInfoCardOneShimmer({super.key, required this.width});
final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)
      ),
    );
  }
}
