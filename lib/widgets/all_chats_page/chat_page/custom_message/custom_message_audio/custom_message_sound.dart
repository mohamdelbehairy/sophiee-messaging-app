import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_audio/custom_mesage_sound_body.dart';
import 'package:sophiee/utils/widget/replay_to_message/replay_sound_message.dart';
import 'package:flutter/material.dart';

class CustomMessageSound extends StatelessWidget {
  const CustomMessageSound(
      {super.key,
      required this.message,
      required this.size,
      required this.user,
      required this.messageTextColor,
      required this.backgroungColor,
      required this.iconColor});
  final MessageModel message;
  final Size size;
  final UserModel user;
  final Color messageTextColor;
  final Color backgroungColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (message.replayTextMessage != '' ||
            message.replayImageMessage != '' ||
            message.replayFileMessage != '' ||
            message.replayContactMessage != '' ||
            message.replaySoundMessage != '' ||
            message.replayRecordMessage != '')
          ReplaySoundMessage(
              size: size, message: message, messageTextColor: messageTextColor),
        CustomMessageSoundBody(
            iconColor: iconColor,
            message: message,
            size: size,
            user: user,
            backgroungColor: backgroungColor),
      ],
    );
  }
}
