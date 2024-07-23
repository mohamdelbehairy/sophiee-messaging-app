import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';
import 'package:video_player/video_player.dart';

import '../../../models/story_model.dart';

class MyStoryPageLeadingVideo extends StatefulWidget {
  const MyStoryPageLeadingVideo(
      {super.key, required this.size, required this.storyModel});
  final Size size;
  final StoryModel storyModel;

  @override
  State<MyStoryPageLeadingVideo> createState() =>
      _MyStoryPageLeadingVideoState();
}

class _MyStoryPageLeadingVideoState extends State<MyStoryPageLeadingVideo> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();

    if (widget.storyModel.storyVideo != null) {
      _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.storyModel.storyVideo!),
      )..initialize().then((_) {
          setState(() {
            _videoPlayerController.setLooping(false);

            _videoPlayerController.addListener(_videoListener);
          });
        });
    }
  }

  void _videoListener() {
    if (_videoPlayerController.value.position ==
        _videoPlayerController.value.duration) {
      setState(() {
        _videoPlayerController.pause();
        _videoPlayerController.seekTo(Duration.zero);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.storyModel.storyVideo != null) {
      _videoPlayerController.removeListener(_videoListener);
      _videoPlayerController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: widget.size.height * .03,
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.size.height * .05),
          child: _videoPlayerController.value.isInitialized
              ? VideoPlayer(_videoPlayerController)
              : const CircularProgressIndicator(color: kPrimaryColor),
        ));
  }
}
