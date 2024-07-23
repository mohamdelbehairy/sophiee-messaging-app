import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import '../../../models/story_model.dart';
import '../../../utils/widget/story_page/story_item_image.dart';
import '../../../utils/widget/story_page/story_item_video.dart';

class StoryViewWidget extends StatelessWidget {
  const StoryViewWidget(
      {super.key, required this.story, required this.controller});

  final List<StoryModel> story;
  final StoryController controller;

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: story.map(
        (url) {
          if (url.storyImage != null) {
            return storyItemImage(url: url, storyController: controller);
          } else if (url.storyVideo != null) {
            return storyItemVideo(url: url, storyController: controller);
          }
        },
      ).toList(),
      controller: controller,
      inline: true,
      repeat: false,
      onComplete: () => Navigator.pop(context),
      onVerticalSwipeComplete: (dir) {
        if (dir == Direction.down) {
          Navigator.pop(context);
        }
      },
    );
  }
}
