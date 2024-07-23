  import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import '../../../models/story_model.dart';

StoryItem storyItemImage(
      {required StoryModel url, required StoryController storyController}) {
    return StoryItem.pageImage(
      duration: const Duration(seconds: 4),
        caption: Text(url.storyText,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 18)),
        url: url.storyImage!,
        controller: storyController);
  }