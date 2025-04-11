import 'package:flutter/material.dart';
import 'package:sophiee/pages/story/show_my_story_page.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../../models/story_model.dart';
import 'my_story_page_leading_image.dart';
import 'my_story_page_leading_video.dart';

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
    return GestureDetector(
      onTap: () =>
          Navigation.push(context, ShowMyStoryPage(storyModel: storyModel)),
      child: storyModel.storyImage != null
          ? MyStoryPageLeadingImage(
              size: size, isDark: isDark, storyModel: storyModel)
          : MyStoryPageLeadingVideo(size: size, storyModel: storyModel),
    );
  }
}
