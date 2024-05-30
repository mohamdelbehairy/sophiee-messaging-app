import 'dart:io';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'pick_video_component.dart';

class PickVideoPageBody extends StatefulWidget {
  const PickVideoPageBody({super.key, required this.video, required this.user});
  final File video;
  final UserModel user;

  @override
  State<PickVideoPageBody> createState() => _PickVideoPageBodyState();
}

class _PickVideoPageBodyState extends State<PickVideoPageBody> {
  late VideoPlayerController videoPlayerController;
  TextEditingController controller = TextEditingController();
  late bool _isPlaying;

  @override
  void initState() {
    super.initState();
    _isPlaying = false;
    videoPlayerController = videoPayerMethod();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.removeListener(_videoListener);
    videoPlayerController.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return PickVideoComponent(
      size: size,
      videoPlayerController: videoPlayerController,
      controller: controller,
      widget: widget,
      onTap: () {
        setState(() {
          if (videoPlayerController.value.isPlaying) {
            videoPlayerController.pause();
          } else {
            videoPlayerController.play();
          }
          _isPlaying = !_isPlaying;
        });
      },
    );
  }

  VideoPlayerController videoPayerMethod() {
    return VideoPlayerController.file(
      File(widget.video.path),
    )..initialize().then((_) {
        videoPlayerController.setLooping(false);
        _isPlaying = true;
        videoPlayerController.addListener(_videoListener);
      });
  }

  void _videoListener() {
    if (videoPlayerController.value.position ==
        videoPlayerController.value.duration) {
      setState(() {
        _isPlaying = false;
        videoPlayerController.pause();
        videoPlayerController.seekTo(Duration.zero);
      });
    }
  }
}
