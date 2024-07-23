import 'package:flutter/material.dart';

import '../../../models/story_model.dart';
import 'my_story_page_leading.dart';
import 'my_story_page_title.dart';
import 'my_story_page_trailing.dart';

class MyStoryPageListTile extends StatelessWidget {
  const MyStoryPageListTile(
      {super.key,
      required this.size,
      required this.isDark,
      required this.differenceInMinutes,
      required this.differenceInHours,
      required this.index,
      required this.storyModel});

  final Size size;
  final bool isDark;
  final int differenceInMinutes, differenceInHours, index;
  final StoryModel storyModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding:
            EdgeInsets.only(left: 16, bottom: 16, top: index == 0 ? 8 : 0.0),
        leading: MyStoryPageLeading(
            size: size, isDark: isDark, storyModel: storyModel),
        title: MyStoryPageTitle(
            size: size,
            isDark: isDark,
            differenceInMinutes: differenceInMinutes,
            differenceInHours: differenceInHours),
        trailing: MyStoryPageTrailing(
            size: size, isDark: isDark, storyModel: storyModel));
  }
}
