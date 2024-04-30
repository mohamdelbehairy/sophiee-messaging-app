import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/utils/widget/messages/item_replaying_message/item_audio_replaying_message.dart';
import 'package:sophiee/utils/widget/messages/item_replaying_message/item_contact_replaying_message.dart';
import 'package:sophiee/utils/widget/messages/item_replaying_message/item_file_replaying_message.dart';
import 'package:sophiee/utils/widget/messages/item_replaying_message/item_image_replaying_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/replaying_message_item_component.dart';



class ReplayMessageImage extends StatelessWidget {
  const ReplayMessageImage(
      {super.key,
      required this.size,
      required this.message,
      required this.backgroungMessage,
      required this.messageColor});
  final Size size;
  final MessageModel message;
  final Color backgroungMessage;
  final Color messageColor;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Container(
      width: size.width * .75,
      padding: EdgeInsets.only(top: size.width * .03, bottom: size.width * .02),
      decoration: BoxDecoration(
        color: backgroungMessage,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
              message.senderID == FirebaseAuth.instance.currentUser!.uid
                  ? 20
                  : 0.0),
          topRight: Radius.circular(
              message.senderID != FirebaseAuth.instance.currentUser!.uid
                  ? 20
                  : message.messageImage != null
                      ? 20
                      : 0.0),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: size.width * .03),
          Container(
              height: size.height * .03,
              width: size.width * .005,
              color: message.senderID == FirebaseAuth.instance.currentUser!.uid
                  ? Colors.white
                  : Colors.grey),
          if (message.replaySoundMessage != '' ||
              message.replayRecordMessage != '')
            SizedBox(width: size.width * .015),
          if (message.replaySoundMessage != '' ||
              message.replayRecordMessage != '')
            ItemAudioReplayingMessage(size: size, messageModel: message),
          if (message.replayImageMessage != '')
            SizedBox(width: size.width * .015),
          if (message.replayImageMessage != '')
            ItemImageReplayingMessage(
                size: size, isDark: isDark, message: message),
          if (message.replayFileMessage != '')
            SizedBox(width: size.width * .015),
          if (message.replayFileMessage != null &&
              message.replayContactMessage == '' &&
              message.replayImageMessage == '' &&
              message.replayTextMessage == '' &&
              message.replaySoundMessage == '' &&
              message.replayRecordMessage == '')
            ItemsFileReplayingMessage(size: size, message: message),
          if (message.replayContactMessage != '')
            SizedBox(width: size.width * .015),
          if (message.replayContactMessage != '')
            ItemContactReplayingMessage(size: size, messageModel: message),
          ReplayingMessageItemComponent(
              width: size.width * .55,
              messageModel: message,
              size: size,
              messageTextColor: messageColor)
        ],
      ),
    );
  }
}
