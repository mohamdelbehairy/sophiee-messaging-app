import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../../cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import '../../../../../cubit/groups/message_group/group_message_cubit.dart';
import '../../../../../cubit/notification/group_notification/group_notification_cubit.dart';
import '../../../../../cubit/upload/upload_file/upload_file_cubit.dart';
import '../groups_chat_page_send_chat_items.dart';
import 'groups_chat_pick_file_page_body.dart';

class GroupChatPickFileButton extends StatelessWidget {
  const GroupChatPickFileButton(
      {super.key,
      required this.size,
      required this.widget,
      required this.uploadFile,
      required this.sendMessage,
      required this.controller,
      required this.sendGroupMessageNotify,
      required this.storeMedia});

  final Size size;
  final GroupsChatPickFilePageBody widget;
  final UploadFileCubit uploadFile;
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
          String fileUrl = await uploadFile.uploadFile(
              fieldName: 'groups_messages_files', file: widget.file);
          String messageID = const Uuid().v4();
          double messageFileSize = await widget.file.length() / 1024 < 1024
              ? await widget.file.length() / 1024
              : await widget.file.length() / 1024 / 1024;
          String messageFileType =
              await widget.file.length() / 1024 < 1024 ? 'KB' : 'MB';
          await sendMessage.sendGroupMessage(
              messageID: messageID,
              messageText: controller.text,
              groupID: widget.groupModel.groupID,
              imageUrl: null,
              videoUrl: null,
              phoneContactName: null,
              phoneContactNumber: null,
              fileUrl: fileUrl,
              messageFileName: widget.messageFileName,
              replayImageMessage: widget.replayImageMessage,
              friendNameReplay: widget.friendNameReplay,
              replayMessageID: widget.replayMessageID,
              replayContactMessage: widget.replayContactMessage,
              replayFileMessage: widget.replayFileMessage,
              replayTextMessage: widget.replayTextMessage,
              replaySoundMessage: widget.replaySoundMessage,
              replayRecordMessage: widget.replayRecordMessage,
              messageFileSize: messageFileSize,
              messageFileType: messageFileType);
          for (int i = 0; i < widget.tokens.length; i++) {
            if (widget.isNotify[i]) {
              sendGroupMessageNotify.sendGroupMessageNotification(
                  receiverToken: widget.tokens[i],
                  senderName: widget.groupModel.groupName,
                  message: '${widget.senderName.split(' ')[0]} sent a file',
                  senderId: widget.groupModel.groupID);
            }
          }

          await storeMedia.storeFile(
              groupID: widget.groupModel.groupID,
              messageID: messageID,
              messageFile: fileUrl,
              messageFileName: widget.messageFileName,
              messageFileSize: messageFileSize,
              messageFileType: messageFileType);
          if (controller.text.isNotEmpty &&
              (controller.text.startsWith('http') ||
                  controller.text.startsWith('https'))) {
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
