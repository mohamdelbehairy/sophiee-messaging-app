import 'package:sophiee/cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/cubit/notification/group_notification/group_notification_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/send_message/send_message_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class CustomSendTextMessageButton extends StatelessWidget {
  const CustomSendTextMessageButton(
      {super.key,
      required this.groupChat,
      required this.controller,
      required this.groupModel,
      required this.scrollController,
      required this.replayTextMessage,
      required this.friendNameReplay,
      required this.replayImageMessage,
      required this.replayFileMessage,
      required this.replayContactMessage,
      required this.replayMessageID,
      required this.replaySoundMessage,
      required this.replayRecordMessage,
      required this.tokens,
      required this.senderName});

  final GroupMessageCubit groupChat;
  final TextEditingController controller;
  final GroupModel groupModel;
  final ScrollController scrollController;
  final String replayTextMessage;
  final String friendNameReplay;
  final String replayImageMessage;
  final String replayFileMessage;
  final String replayContactMessage;
  final String replayMessageID;
  final String replaySoundMessage;
  final String replayRecordMessage;
  final List<String> tokens;
  final String senderName;

  @override
  Widget build(BuildContext context) {
    var storeMedia = context.read<GroupStoreMediaFilesCubit>();
    var sendGroupChatNotify = context.read<GroupNotificationCubit>();
    return SendMessageButton(
        onTap: () async {
          String messageID = const Uuid().v4();
          groupChat.sendGroupMessage(
              messageID: messageID,
              messageText: controller.text,
              imageUrl: null,
              videoUrl: null,
              groupID: groupModel.groupID,
              replayImageMessage: replayImageMessage,
              friendNameReplay: friendNameReplay,
              replayMessageID: replayMessageID,
              replayContactMessage: replayContactMessage,
              replayFileMessage: replayFileMessage,
              replayTextMessage: replayTextMessage,
              replaySoundMessage: replaySoundMessage,
              replayRecordMessage: replayRecordMessage);

          for (var element in tokens) {
            debugPrint('token: $element');

            await sendGroupChatNotify.sendGroupMessageNotification(
                receiverToken: element,
                senderName: groupModel.groupName,
                message: '${senderName.split(' ')[0]} sent ${controller.text}',
                senderId: groupModel.groupID);
          }

          if (controller.text.startsWith('http') ||
              controller.text.startsWith('https')) {
            storeMedia.storeLink(
                messageID: messageID,
                groupID: groupModel.groupID,
                messageLink: controller.text);
          }

          controller.clear();
          scrollController.animateTo(0,
              duration: const Duration(microseconds: 20), curve: Curves.easeIn);
        },
        icon: Icons.send);
  }
}
