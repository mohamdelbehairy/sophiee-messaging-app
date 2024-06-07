import 'dart:io';

import 'package:sophiee/cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import 'package:sophiee/cubit/upload/upload_video/upload_video_cubit.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../../../cubit/notification/group_notification/group_notification_cubit.dart';
import 'group_chat_pick_video_component.dart';

class GroupsChatPickVideoPageBody extends StatefulWidget {
  const GroupsChatPickVideoPageBody(
      {super.key,
      required this.video,
      required this.groupModel,
      required this.tokens,
      required this.senderName,
      required this.isNotify});
  final File video;
  final GroupModel groupModel;
  final List<String> tokens;
  final String senderName;
  final List<bool> isNotify;

  @override
  State<GroupsChatPickVideoPageBody> createState() =>
      _GroupsChatPickVideoPageBodyState();
}

class _GroupsChatPickVideoPageBodyState
    extends State<GroupsChatPickVideoPageBody> {
  late VideoPlayerController videoPlayerController;
  TextEditingController controller = TextEditingController();
  late bool _isPlaying;

  @override
  void initState() {
    super.initState();
    _isPlaying = false;
    videoPlayerController = videoPayerMethod();
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

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.removeListener(_videoListener);
    videoPlayerController.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sendMessage = context.read<GroupMessageCubit>();
    var uploadVideo = context.read<UploadVideoCubit>();
    var storeMedia = context.read<GroupStoreMediaFilesCubit>();
    var sendGroupMessageNotify = context.read<GroupNotificationCubit>();
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
        return GroupChatPickVideoComponent(
          isLoading: isLoading,
          size: size,
          videoPlayerController: videoPlayerController,
          controller: controller,
          widget: widget,
          uploadVideo: uploadVideo,
          sendMessage: sendMessage,
          sendGroupMessageNotify: sendGroupMessageNotify,
          storeMedia: storeMedia,
          onTap: () {
            if (!isLoading) {
              setState(() {
                if (videoPlayerController.value.isPlaying) {
                  videoPlayerController.pause();
                } else {
                  videoPlayerController.play();
                }
                _isPlaying = !_isPlaying;
              });
            }
          },
        );
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
}
