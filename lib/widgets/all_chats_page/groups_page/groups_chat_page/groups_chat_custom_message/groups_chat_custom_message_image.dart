import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_image/replay_message_image.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_custom_message/groups_chat_custom_message_image_body.dart';
import 'package:flutter/material.dart';

class GroupsChatCustomMessageImage extends StatelessWidget {
  const GroupsChatCustomMessageImage(
      {super.key,
      required this.user,
      required this.message,
      required this.backgroundMessageColor,
      required this.messageColor});
  final UserModel user;
  final MessageModel message;
  final Color backgroundMessageColor;
  final Color messageColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        if (message.replayTextMessage != '' ||
            message.replayImageMessage != '' ||
            message.replayFileMessage != '' ||
            message.replayContactMessage != '' ||
            message.replaySoundMessage != '' ||
            message.replayRecordMessage != '')
          ReplayMessageImage(
              message: message,
              size: size,
              backgroungMessage: backgroundMessageColor,
              messageColor: messageColor),
        GroupsChatCustomMessageImageBody(size: size, message: message),
      ],
    );
  }
}
