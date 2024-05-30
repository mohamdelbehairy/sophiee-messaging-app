import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PickVideoCustomVideo extends StatelessWidget {
  const PickVideoCustomVideo(
      {super.key, required this.size, required this.videoPlayerController});

  final Size size;
  final VideoPlayerController videoPlayerController;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: size.height,
            width: size.width,
            child: VideoPlayer(videoPlayerController)));
  }
}
