import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import '../../../models/story_model.dart';
import '../../../utils/widget/story_page/story_item_image.dart';
import '../../../utils/widget/story_page/story_item_video.dart';

class MyStoryPageWidget extends StatelessWidget {
  const MyStoryPageWidget({super.key, required this.storyModel});

  final StoryModel storyModel;

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: [
        if (storyModel.storyImage != null)
          storyItemImage(url: storyModel, storyController: StoryController()),
        if (storyModel.storyVideo != null)
          storyItemVideo(url: storyModel, storyController: StoryController())
      ],
      controller: StoryController(),
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
