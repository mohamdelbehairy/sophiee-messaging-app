import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/messages/custom_message_record.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_custom_message/groups_chat_custom_message_contact.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_custom_message/groups_chat_custom_message_file.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_custom_message/groups_chat_custom_message_image.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_custom_message/groups_chat_custom_message_text.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_custom_message/groups_chat_custom_message_video.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'groups_chat_custom_message_sound.dart';

class GroupsChatCustomMessageDetailsBody extends StatelessWidget {
  const GroupsChatCustomMessageDetailsBody(
      {super.key,
      required this.message,
      required this.user,
      required this.groupModel,
      required this.messageTextColor,
      required this.backgroundMessageColor});

  final MessageModel message;
  final UserModel user;
  final GroupModel groupModel;
  final Color messageTextColor;
  final Color backgroundMessageColor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: message.messageImage != null ||
              message.messageVideo != null && message.messageText != '' ||
              message.messageFile != null
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        if (message.messageRecord != null)
          CustomMessageRecord(
            iconColor: message.senderID ==
                          FirebaseAuth.instance.currentUser!.uid
                      ? Colors.white
                      : Colors.grey,
              sliderWidth: message.replaySoundMessage != ''
                  ? size.width * .66
                  : message.senderID == FirebaseAuth.instance.currentUser!.uid
                      ? size.width * .55
                      : size.width * .45,
              message: message,
              size: size,
              messageTextColor: messageTextColor),
        if (message.messageSound != null)
          GroupsChatCustomMessageSound(
              nameColor:
                  message.senderID == FirebaseAuth.instance.currentUser!.uid
                      ? Colors.white
                      : Colors.black,
              message: message,
              size: size,
              groupModel: groupModel,
              user: user),
        if (message.phoneContactNumber != null)
          GroupsChatCustomMessageContact(message: message, user: user),
        if (message.messageVideo != null)
          GroupsChatCustomMessageVideo(message: message, user: user),
        if (message.messageFile != null)
          GroupsChatCustomMessageFile(
              message: message, user: user, messageTextColor: messageTextColor),
        if (message.messageImage != null && message.messageText == '')
          GroupsChatCustomMessageImage(
              user: user,
              message: message,
              messageColor: messageTextColor,
              backgroundMessageColor: backgroundMessageColor),
        if (message.messageImage != null && message.messageText != '')
          GroupsChatCustomMessageImage(
              user: user,
              message: message,
              messageColor: messageTextColor,
              backgroundMessageColor: backgroundMessageColor),
        if (message.messageText != '')
          GroupsChatCustomMessageText(
              message: message, user: user, messageTextColor: messageTextColor),
      ],
    );
  }
}
