import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/utils/widget/messages/item_replaying_message/item_audio_replaying_message.dart';
import 'package:sophiee/utils/widget/messages/item_replaying_message/item_contact_replaying_message.dart';
import 'package:sophiee/utils/widget/messages/item_replaying_message/item_file_replaying_message.dart';
import 'package:sophiee/utils/widget/messages/item_replaying_message/item_image_replaying_message.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/replaying_message_item_component.dart';

class ReplaySoundMessage extends StatelessWidget {
  const ReplaySoundMessage(
      {super.key,
      required this.size,
      required this.message,
      required this.messageTextColor});
  final Size size;
  final MessageModel message;
  final Color messageTextColor;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            height: size.height * .03,
            width: size.width * .005,
            margin:
                EdgeInsets.only(top: size.width * .02, left: size.width * .04),
            color: message.senderID == FirebaseAuth.instance.currentUser!.uid
                ? Colors.white
                : Colors.grey),
        if (message.replaySoundMessage != '' ||
            message.replayRecordMessage != '')
          Padding(
              padding: EdgeInsets.only(
                  top: size.width * .025, left: size.width * .02),
              child:
                  ItemAudioReplayingMessage(size: size, messageModel: message)),
        if (message.replayImageMessage != '')
          Padding(
              padding: EdgeInsets.only(
                  top: size.width * .025, left: size.width * .02),
              child: ItemImageReplayingMessage(
                  size: size, isDark: isDark, message: message)),
        if (message.replayFileMessage != null &&
            message.replayTextMessage == '' &&
            message.replaySoundMessage == '' &&
            message.replayRecordMessage == '')
          SizedBox(width: size.width * .015),
        if (message.replayFileMessage != null &&
            message.replayContactMessage == '' &&
            message.replayImageMessage == '' &&
            message.replayTextMessage == '' &&
            message.replaySoundMessage == '' &&
            message.replayRecordMessage == '')
          ItemsFileReplayingMessage(size: size, message: message),
        if (message.replayContactMessage != null &&
            message.replayTextMessage == '' &&
            message.replayImageMessage == '' &&
            message.replayFileMessage == '' &&
            message.replaySoundMessage == '' &&
            message.replayRecordMessage == '')
          ItemContactReplayingMessage(size: size, messageModel: message),
        Padding(
          padding: EdgeInsets.only(top: size.width * .02),
          child: SizedBox(
              width:
                  message.messageSoundName != '' && message.messageSound != null
                      ? size.width * .55
                      : message.replayFileMessage != ''
                          ? size.width * .64
                          : size.width * .4,
              child: ReplayingMessageItemComponent(
                  messageModel: message,
                  size: size,
                  messageTextColor: messageTextColor,
                  width: size.width)),
        ),
      ],
    );
  }
}
