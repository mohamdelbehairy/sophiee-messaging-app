import 'package:sophiee/constants.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/messages/replay_message/replay_message_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GroupsChatCustomMessageText extends StatelessWidget {
  const GroupsChatCustomMessageText(
      {super.key,
      required this.message,
      required this.user,
      required this.messageTextColor});
  final MessageModel message;
  final UserModel user;
  final Color messageTextColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // if (message.messageFile != null) {
    //   return SizedBox();
    // }
    return Padding(
      padding: EdgeInsets.only(
          top: message.messageImage != null && message.messageText == ''
              ? 0.0
              : message.messageImage != null && message.messageText != ''
                  ? size.height * .01
                  : size.height * .015,
          bottom: message.messageImage != null && message.messageText == ''
              ? 0.0
              : message.messageImage != null && message.messageText != ''
                  ? size.height * .01
                  : size.height * .015,
          left: message.messageVideo != null && message.messageText != ''
              ? size.width * .025
              : message.replaySoundMessage != '' && message.messageImage == null
                  ? 0.0
                  : size.width * .032,
          right: message.messageText.length > 5 ? 8 : 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.senderID != FirebaseAuth.instance.currentUser!.uid &&
              message.messageImage == null &&
              message.messageVideo == null &&
              message.phoneContactNumber == null)
            Text(user.userName,
                style: TextStyle(
                    fontSize: size.width * .035,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.normal)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message.replayTextMessage != '' ||
                  message.replayImageMessage != '' ||
                  message.replayFileMessage != '' ||
                  message.replayContactMessage != '' ||
                  message.replaySoundMessage != '' ||
                  message.replayRecordMessage != '')
                ReplayMessageText(
                    size: size,
                    messageModel: message,
                    messageTextColor: messageTextColor),
              GestureDetector(
                onTap: () {
                  if (message.messageText.startsWith('http') ||
                      message.messageText.startsWith('https')) {
                    launchUrl(Uri.parse(message.messageText));
                  }
                },
                child: Text(
                  message.messageText,
                  style: TextStyle(
                    color: message.messageText.startsWith('http') ||
                            message.messageText.startsWith('https')
                        ? Colors.indigo
                        : message.senderID ==
                                FirebaseAuth.instance.currentUser!.uid
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
