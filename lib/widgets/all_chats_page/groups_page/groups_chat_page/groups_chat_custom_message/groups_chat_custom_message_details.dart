import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_custom_message/group_chat_custom_message_friend_image.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_custom_message/groups_chat_custom_message_details_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GroupsChatCustomMessageDetails extends StatelessWidget {
  const GroupsChatCustomMessageDetails(
      {super.key,
      required this.message,
      required this.alignment,
      required this.bottomLeft,
      required this.bottomRight,
      required this.user,
      required this.backGroundMessageColor,
      required this.isSeen,
      required this.messageTextColor,
      required this.groupModel, required this.userData});
  final MessageModel message;
  final UserModel user,userData;
  final Alignment alignment;
  final Radius bottomLeft;
  final Radius bottomRight;
  final Color backGroundMessageColor;
  final bool isSeen;
  final Color messageTextColor;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Align(
          alignment: alignment,
          child: Container(
            width: message.replayRecordMessage != '' &&
                    message.messageFile != null &&
                    message.messageText != ''
                ? size.width * .53
                : message.messageImage != null ||
                        message.messageVideo != null ||
                        message.messageFile != null ||
                        message.phoneContactNumber != null ||
                        message.messageSound != null ||
                        message.messageRecord != null ||
                        message.replayTextMessage != '' ||
                        message.replayFileMessage != '' ||
                        message.replayImageMessage != '' ||
                        message.replayContactMessage != ''
                    // message.replaySoundMessage != ''
                    ? null
                    : message.replaySoundMessage != '' ||
                            message.replayRecordMessage != '' &&
                                message.messageText != '' &&
                                message.messageFile != null
                        ? size.width * .65
                        : message.replaySoundMessage != '' ||
                                (message.replayRecordMessage != '')
                            ? null
                            : message.messageText.length <= 4
                                ? size.width * .2
                                : message.messageText.length > 50
                                    ? size.width * .8
                                    : null,
            margin: EdgeInsets.symmetric(
                horizontal:
                    message.senderID != FirebaseAuth.instance.currentUser!.uid
                        ? size.width * .14
                        : size.width * .03,
                vertical: size.width * .003),
            padding: EdgeInsets.only(
                right: message.messageImage != null ||
                        message.messageVideo != null ||
                        message.messageSound != null ||
                        message.messageRecord != null
                    ? 0.0
                    : message.messageFile != null
                        ? size.width * .02
                        : size.width * .01,
                left: message.messageFile != null ? 6 : 0,
                bottom: message.messageFile != null
                    ? 6
                    : message.phoneContactNumber != null
                        ? 8
                        : 0.0,
                top: message.phoneContactNumber != null ? 8 : 0.0),
            decoration: BoxDecoration(
              color: message.messageImage != null && message.messageText == ''
                  ? Colors.transparent
                  : backGroundMessageColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                    message.messageText.length <= 100 ? 16 : 24),
                topLeft: Radius.circular(message.receiverID ==
                                FirebaseAuth.instance.currentUser!.uid &&
                            message.messageText.length <= 100 ||
                        message.messageSound != null ||
                        message.messageRecord != null
                    ? 16
                    : 24),
                bottomRight: Radius.circular(
                    message.senderID != FirebaseAuth.instance.currentUser!.uid
                        ? 24
                        : 0),
                bottomLeft: Radius.circular(message.senderID !=
                        FirebaseAuth.instance.currentUser!.uid
                    ? message.messageImage != null && message.messageText != ''
                        ? 20
                        : 0
                    : message.messageSound != null ||
                            message.messageRecord != null
                        ? 16
                        : 24),
              ),
            ),
            child: GroupsChatCustomMessageDetailsBody(
                messageTextColor: messageTextColor,
                backgroundMessageColor: backGroundMessageColor,
                groupModel: groupModel,
                message: message,
                user: user),
          ),
        ),
        if (message.senderID != FirebaseAuth.instance.currentUser!.uid)
          GroupChatCustomMessageFriendImage(
            userData: userData,
              size: size, user: user, messageModel: message)
      ],
    );
  }
}
