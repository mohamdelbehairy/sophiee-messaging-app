import 'package:flutter/material.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/replaying_message_item_component.dart';

class ReplayMessageTextComponent extends StatelessWidget {
  const ReplayMessageTextComponent(
      {super.key,
      required this.messageModel,
      required this.size,
      required this.messageTextColor});
  final MessageModel messageModel;
  final Size size;
  final Color messageTextColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: messageModel.replayTextMessage != '' ||
              messageModel.replayImageMessage != ''
          ? size.width * .35
          : messageModel.replayFileMessage != '' ||
                  messageModel.replaySoundMessage != ''
              ? size.width * .45
              : messageModel.replayRecordMessage != ''
                  ? size.width * .3
                  : messageModel.replayContactMessage != ''
                      ? size.width * .35
                      : 0.0,
      child: ReplayingMessageItemComponent(
          width: size.width * .55,
          messageModel: messageModel,
          size: size,
          messageTextColor: messageTextColor),
    );
  }
}
