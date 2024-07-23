  import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import '../../../models/story_model.dart';

StoryItem storyItemVideo(
      {required StoryModel url, required StoryController storyController}) {
    return StoryItem.pageVideo(
        duration: Duration(seconds: url.storyVideoTime!),
        caption: Text(url.storyText,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 18)),
        url.storyVideo!,
        controller: storyController);
  }