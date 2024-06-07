import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../../cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import '../../../../../cubit/groups/message_group/group_message_cubit.dart';
import '../../../../../cubit/notification/group_notification/group_notification_cubit.dart';
import '../../../../../cubit/upload/upload_video/upload_video_cubit.dart';
import '../groups_chat_page_send_chat_items.dart';
import 'groups_chat_pick_video_page_body.dart';

class GroupsChatPickVideoButton extends StatelessWidget {
  const GroupsChatPickVideoButton({
    super.key,
    required this.size,
    required this.widget,
    required this.isLoading,
    required this.uploadVideo,
    required this.sendMessage,
    required this.controller,
    required this.sendGroupMessageNotify,
    required this.storeMedia,
  });

  final Size size;
  final GroupsChatPickVideoPageBody widget;
  final bool isLoading;
  final UploadVideoCubit uploadVideo;
  final GroupMessageCubit sendMessage;
  final TextEditingController controller;
  final GroupNotificationCubit sendGroupMessageNotify;
  final GroupStoreMediaFilesCubit storeMedia;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: size.width,
      bottom: size.height * .015,
      child: GroupsChatSendItemChatBottom(
        groupModel: widget.groupModel,
        isClick: isLoading,
        onTap: () async {
          String videoUrl = await uploadVideo.uploadVideo(
              fieldName: 'groups_messages_videos', videoFile: widget.video);
          String messageID = const Uuid().v4();
          await sendMessage.sendGroupMessage(
              messageID: messageID,
              messageText: controller.text,
              groupID: widget.groupModel.groupID,
              imageUrl: null,
              videoUrl: videoUrl,
              replayImageMessage: '',
              friendNameReplay: '',
              replayMessageID: '');

          for (int i = 0; i < widget.tokens.length; i++) {
            if (widget.isNotify[i]) {
              sendGroupMessageNotify.sendGroupMessageNotification(
                  receiverToken: widget.tokens[i],
                  senderName: widget.groupModel.groupName,
                  message: '${widget.senderName.split(' ')[0]} sent a video',
                  senderId: widget.groupModel.groupID);
            }
          }
          await storeMedia.storeMedia(
              groupID: widget.groupModel.groupID,
              messageID: messageID,
              messageVideo: videoUrl,
              messageText: controller.text.isNotEmpty ? controller.text : '');

          if (controller.text.startsWith('http') ||
              controller.text.startsWith('https')) {
            await storeMedia.storeLink(
                groupID: widget.groupModel.groupID,
                messageID: messageID,
                messageLink: controller.text);
          }
        },
      ),
    );
  }
}
