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


class ReplayRecordMessage extends StatelessWidget {
  const ReplayRecordMessage(
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
            margin: EdgeInsets.only(
                top: size.width * .015,
                left: message.replayImageMessage != ''
                    ? size.width * .025
                    : message.replayFileMessage != null &&
                            message.replayTextMessage != ''
                        ? size.width * .03
                        : size.width * .03),
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
        if (message.replayFileMessage != '' && message.replayTextMessage != '')
          SizedBox(width: size.width * .015),
        if (message.replayFileMessage != '')
          Padding(
              padding: EdgeInsets.only(top: size.width * .01),
              child: ItemsFileReplayingMessage(size: size, message: message)),
        if (message.replayContactMessage != null &&
            message.replayTextMessage == '' &&
            message.replayImageMessage == '' &&
            message.replayFileMessage == '' &&
            message.replaySoundMessage == '' &&
            message.replayRecordMessage == '')
          Padding(
              padding: EdgeInsets.only(top: size.width * .025),
              child: ItemContactReplayingMessage(
                  size: size, messageModel: message)),
        Padding(
          padding: EdgeInsets.only(top: size.width * .02),
          child: SizedBox(
              width: message.replayFileMessage != '' ||
                      message.replayContactMessage != '' ||
                      message.replayRecordMessage != ''
                  ? size.width * .55
                  : message.replayImageMessage != ''
                      ? size.width * .52
                      : size.width * .65,
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
