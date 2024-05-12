import 'package:sophiee/constants.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ListTileLeading extends StatelessWidget {
  const ListTileLeading(
      {super.key,
      this.image =
          'https://statusneo.com/wp-content/uploads/2023/02/MicrosoftTeams-image551ad57e01403f080a9df51975ac40b6efba82553c323a742b42b1c71c1e45f1.jpg',
      required this.isDark});
  final String image;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
            radius: 28,
            backgroundColor: Colors.transparent,
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 25,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: FancyShimmerImage(
                        boxFit: BoxFit.cover,
                        shimmerBaseColor:
                            isDark ? Colors.white12 : Colors.grey.shade300,
                        shimmerHighlightColor:
                            isDark ? Colors.white24 : Colors.grey.shade100,
                        imageUrl: image)))),
         Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 3, end: 1),
            child: CircleAvatar(
                radius: 9,
                backgroundColor: isDark
                                  ? kDarkModeColor
                                  : const Color(0xfff1f2f2),
                child: const CircleAvatar(backgroundColor: kPrimaryColor, radius: 7)))
      ],
    );
  }
}
