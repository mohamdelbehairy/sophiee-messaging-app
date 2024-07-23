import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../models/story_model.dart';

class MyStoryPageLeading extends StatelessWidget {
  const MyStoryPageLeading(
      {super.key,
        required this.size,
        required this.isDark,
        required this.storyModel});

  final Size size;
  final bool isDark;
  final StoryModel storyModel;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: size.height * .035,
        backgroundColor: Colors.transparent,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(size.height * .035),
            child: FancyShimmerImage(
                boxFit: BoxFit.cover,
                shimmerBaseColor:
                isDark ? Colors.white12 : Colors.grey.shade300,
                shimmerHighlightColor:
                isDark ? Colors.white24 : Colors.grey.shade100,
                imageUrl: storyModel.storyImage!)));
  }
}