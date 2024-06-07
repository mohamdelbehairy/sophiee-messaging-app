import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../pick_items_text_field.dart';
import '../pick_video_send_video_button.dart';
import 'pick_video_custom_video.dart';
import 'pick_video_page_body.dart';
import 'pick_video_play.dart';

class PickVideoComponent extends StatelessWidget {
  const PickVideoComponent(
      {super.key,
      required this.size,
      required this.videoPlayerController,
      required this.controller,
      required this.widget,
      required this.onTap,
      required this.isLoading});

  final Size size;
  final VideoPlayerController videoPlayerController;
  final TextEditingController controller;
  final PickVideoPageBody widget;
  final Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          PickVideoCustomVideo(
              size: size, videoPlayerController: videoPlayerController),
          PickItemsTextField(
              size: size, controller: controller, isLoading: isLoading),
          PickVideoSendVideoMessageButton(
              isLoading: isLoading,
              size: size,
              user: widget.user,
              video: widget.video,
              controller: controller),
          if (!videoPlayerController.value.isPlaying)
            PickVideoPlayVideo(size: size),
        ],
      ),
    );
  }
}
