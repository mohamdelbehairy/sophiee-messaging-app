import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/upload/upload_video/upload_video_cubit.dart';
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
      required this.onTap});

  final Size size;
  final VideoPlayerController videoPlayerController;
  final TextEditingController controller;
  final PickVideoPageBody widget;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var isLoading = context.read<UploadVideoCubit>().isLoading;
    return BlocConsumer<UploadVideoCubit, UploadVideoState>(
      listener: (context, state) {
        if (state is UploadVideoLoading) {
          isLoading = state.isLoading;
        }

        if (state is UploadVideoSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
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
      },
    );
  }
}
