import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ShowStoryPublishInfo extends StatelessWidget {
  const ShowStoryPublishInfo(
      {super.key,
      required this.size,
      required this.isDark,
      required this.title,
      required this.imageUrl});

  final Size size;
  final String title, imageUrl;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 12,
      child: SizedBox(
        height: size.height * .08,
        width: size.width,
        child: ListTile(
          title: Text(title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(size.width * .15),
                child: FancyShimmerImage(
                    boxFit: BoxFit.cover,
                    shimmerBaseColor:
                        isDark ? Colors.white12 : Colors.grey.shade300,
                    shimmerHighlightColor:
                        isDark ? Colors.white24 : Colors.grey.shade100,
                    imageUrl: imageUrl),
              )),
        ),
      ),
    );
  }
}
