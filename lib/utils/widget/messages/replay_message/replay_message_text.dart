import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/utils/widget/messages/item_replaying_message/item_audio_replaying_message.dart';
import 'package:sophiee/utils/widget/messages/item_replaying_message/item_contact_replaying_message.dart';
import 'package:sophiee/utils/widget/messages/item_replaying_message/item_file_replaying_message.dart';
import 'package:sophiee/utils/widget/messages/item_replaying_message/item_image_replaying_message.dart';
import 'package:sophiee/utils/widget/messages/replay_message/replay_message_text_component.dart';

class ReplayMessageText extends StatelessWidget {
  const ReplayMessageText(
      {super.key,
      required this.size,
      required this.messageModel,
      required this.messageTextColor});

  final Size size;
  final MessageModel messageModel;
  final Color messageTextColor;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (messageModel.messageImage == null &&
            messageModel.messageFile == null &&
            messageModel.messageVideo == null)
          Container(
              height: size.height * .03,
              width: size.width * .005,
              color: messageModel.senderID ==
                      FirebaseAuth.instance.currentUser!.uid
                  ? Colors.white
                  : Colors.grey),
        if (messageModel.replaySoundMessage != '' ||
            messageModel.replayRecordMessage != '')
          SizedBox(width: size.width * .015),
        if (messageModel.replaySoundMessage != '' &&
            messageModel.replayRecordMessage != '' &&
            messageModel.replayContactMessage == '' &&
            messageModel.replayImageMessage == '' &&
            messageModel.messageImage == null &&
            messageModel.messageFile == null)
          ItemAudioReplayingMessage(size: size, messageModel: messageModel),
        if ((messageModel.replaySoundMessage != '' &&
                messageModel.messageText != '' &&
                messageModel.messageImage == null &&
                messageModel.messageVideo == null &&
                messageModel.messageFile == null) ||
            (messageModel.replayRecordMessage != '' &&
                messageModel.messageText != '' &&
                messageModel.messageImage == null &&
                messageModel.messageVideo == null &&
                messageModel.messageFile == null))
          ItemAudioReplayingMessage(size: size, messageModel: messageModel),
        if (messageModel.replayImageMessage != '')
          SizedBox(width: size.width * .015),
        if (messageModel.replayImageMessage != '' &&
            messageModel.messageImage == null &&
            messageModel.messageFile == null)
          ItemImageReplayingMessage(
              size: size, isDark: isDark, message: messageModel),
        if (messageModel.replayFileMessage != '')
          SizedBox(width: size.width * .015),
        if (messageModel.replayFileMessage != '' &&
            messageModel.replayContactMessage == '' &&
            messageModel.replayImageMessage == '' &&
            messageModel.messageImage == null &&
            messageModel.messageFile == null)
          ItemsFileReplayingMessage(size: size, message: messageModel),
        if (messageModel.replayContactMessage != null &&
            messageModel.replayImageMessage == '' &&
            messageModel.replayFileMessage == '' &&
            messageModel.replayTextMessage == '' &&
            messageModel.replayRecordMessage == '' &&
            messageModel.replaySoundMessage == '')
          SizedBox(width: size.width * .015),
        if (messageModel.replayContactMessage != null &&
            messageModel.replayFileMessage == '' &&
            messageModel.replayTextMessage == '' &&
            messageModel.replayImageMessage == '' &&
            messageModel.replaySoundMessage == '' &&
            messageModel.replayRecordMessage == '' &&
            messageModel.messageImage == null &&
            messageModel.messageFile == null)
          ItemContactReplayingMessage(size: size, messageModel: messageModel),
        if (messageModel.messageImage == null &&
            messageModel.messageFile == null &&
            messageModel.messageVideo == null)
          ReplayMessageTextComponent(
              messageTextColor: messageTextColor,
              messageModel: messageModel,
              size: size),
      ],
    );
  }
}
