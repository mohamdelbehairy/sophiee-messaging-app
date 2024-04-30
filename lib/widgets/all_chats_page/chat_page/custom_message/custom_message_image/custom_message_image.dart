import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_image/chat_message_image.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_image/replay_message_image.dart';
import 'package:flutter/material.dart';

class CustomMessageImage extends StatelessWidget {
  const CustomMessageImage(
      {super.key,
      required this.message,
      required this.user,
      required Size size,
      required this.backgroundMessageColor,
      required this.messageColor});
  final MessageModel message;
  final UserModel user;
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
        ChatMessageImage(message: message, size: size),
      ],
    );
  }
}
