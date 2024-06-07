import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../../cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import '../../../../../cubit/groups/message_group/group_message_cubit.dart';
import '../../../../../cubit/notification/group_notification/group_notification_cubit.dart';
import '../../../../../cubit/upload/upload_image/upload_image_cubit.dart';
import '../groups_chat_page_send_chat_items.dart';
import 'groups_chat_pick_image_page_body.dart';

class GroupChatPickImageButton extends StatelessWidget {
  const GroupChatPickImageButton(
      {super.key,
      required this.size,
      required this.widget,
      required this.uploadImage,
      required this.sendMessage,
      required this.controller,
      required this.sendGroupMessageNotify,
      required this.storeMedia});

  final Size size;
  final GroupsChatPickImagePageBody widget;
  final UploadImageCubit uploadImage;
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
        isClick: widget.isLoading,
        onTap: () async {
          String imageUrl = await uploadImage.uploadImage(
              imageFile: widget.image, fieldName: 'groups_messages_images');
          String messageID = const Uuid().v4();
          await sendMessage.sendGroupMessage(
              messageID: messageID,
              imageUrl: imageUrl,
              videoUrl: null,
              messageText: controller.text,
              groupID: widget.groupModel.groupID,
              replayImageMessage: widget.replayImageMessage,
              friendNameReplay: widget.friendNameReplay,
              replayMessageID: widget.replayMessageID,
              replayContactMessage: widget.replayContactMessage,
              replayFileMessage: widget.replayFileMessage,
              replayTextMessage: widget.replayTextMessage,
              replaySoundMessage: widget.replaySoundMessage,
              replayRecordMessage: widget.replayRecordMessage);
          for (int i = 0; i < widget.tokens.length; i++) {
            if (widget.isNotify[i]) {
              sendGroupMessageNotify.sendGroupMessageNotification(
                  receiverToken: widget.tokens[i],
                  senderName: widget.groupModel.groupName,
                  message: '${widget.senderName.split(' ')[0]} sent an image',
                  senderId: widget.groupModel.groupID);
            }
          }

          await storeMedia.storeMedia(
              groupID: widget.groupModel.groupID,
              messageImage: imageUrl,
              messageID: messageID,
              messageText: controller.text.isEmpty ? controller.text : null);
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
