import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import '../../../models/story_model.dart';
import 'show_story_publish_info.dart';
import 'story_view_widget.dart';

class StoryViewPageBody extends StatelessWidget {
  const StoryViewPageBody(
      {super.key,
      required this.story,
      required this.controller,
      required this.userID,
      required this.size,
      required this.isDark});

  final List<StoryModel> story;
  final StoryController controller;
  final String userID;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          StoryViewWidget(story: story, controller: controller),
          ShowStoryPublishInfo(userID: userID, size: size, isDark: isDark),
        ],
      ),
    );
  }
}
