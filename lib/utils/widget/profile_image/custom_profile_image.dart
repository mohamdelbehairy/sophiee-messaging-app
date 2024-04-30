import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage(
      {super.key,
      required this.size,
      required this.isDark,
      required this.imageUrl});

  final Size size;
  final bool isDark;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size.width * .15,
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size.width * .15),
        child: FancyShimmerImage(
            boxFit: BoxFit.cover,
            shimmerBaseColor: isDark ? Colors.white12 : Colors.grey.shade300,
            shimmerHighlightColor:
                isDark ? Colors.white24 : Colors.grey.shade100,
            imageUrl: imageUrl),
      )
    );
  }
}
