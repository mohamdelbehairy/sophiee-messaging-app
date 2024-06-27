import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import '../../../../../cubit/groups/message_group/group_message_cubit.dart';
import '../../../../../cubit/notification/group_notification/group_notification_cubit.dart';
import '../../../../../cubit/upload/upload_video/upload_video_cubit.dart';
import '../../../chat_page/pick_chat_items/pick_items_text_field.dart';
import '../../../chat_page/pick_chat_items/pick_video_page/pick_video_custom_video.dart';
import '../../../chat_page/pick_chat_items/pick_video_page/pick_video_play.dart';
import 'groups_chat_pick_video_button.dart';
import 'groups_chat_pick_video_page_body.dart';

class GroupChatPickVideoComponent extends StatelessWidget {
  const GroupChatPickVideoComponent(
      {super.key,
      required this.size,
      required this.videoPlayerController,
      required this.controller,
      required this.widget,
      required this.uploadVideo,
      required this.sendMessage,
      required this.sendGroupMessageNotify,
      required this.storeMedia,
      required this.onTap,
      required this.isLoading});

  final Size size;
  final VideoPlayerController videoPlayerController;
  final TextEditingController controller;
  final GroupsChatPickVideoPageBody widget;
  final UploadVideoCubit uploadVideo;
  final GroupMessageCubit sendMessage;
  final GroupNotificationCubit sendGroupMessageNotify;
  final GroupStoreMediaFilesCubit storeMedia;
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
          GroupsChatPickVideoButton(
              size: size,
              widget: widget,
              isLoading: isLoading,
              uploadVideo: uploadVideo,
              sendMessage: sendMessage,
              controller: controller,
              sendGroupMessageNotify: sendGroupMessageNotify,
              storeMedia: storeMedia),
          if (!videoPlayerController.value.isPlaying)
            PickVideoPlayVideo(size: size),
        ],
      ),
    );
  }
}
