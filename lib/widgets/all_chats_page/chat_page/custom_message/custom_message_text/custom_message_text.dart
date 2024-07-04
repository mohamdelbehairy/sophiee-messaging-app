import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/utils/widget/messages/replay_message/replay_message_text.dart';
import 'package:flutter/material.dart';

class CustomMessageText extends StatelessWidget {
  const CustomMessageText({
    super.key,
    required this.messageModel,
    required this.size,
    required this.messageTextColor,
  });
  final MessageModel messageModel;
  final Size size;
  final Color messageTextColor;

  @override
  Widget build(BuildContext context) {
    // var messages = context.read<MessageCubit>();
    return Padding(
      padding: EdgeInsets.only(
          top: messageModel.messageImage != null &&
                  messageModel.messageText == ''
              ? 0.0
              : messageModel.messageImage != null &&
                      messageModel.messageText != ''
                  ? size.height * .01
                  : size.height * .015,
          bottom: messageModel.messageImage != null &&
                  messageModel.messageText == ''
              ? 0.0
              : messageModel.messageImage != null &&
                      messageModel.messageText != ''
                  ? size.height * .01
                  : size.height * .015,
          left: size.width * .032,
          right: messageModel.messageText.length > 5 ? 8 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (messageModel.replayTextMessage != '' ||
              messageModel.replayImageMessage != '' ||
              messageModel.replayFileMessage != '' ||
              messageModel.replayContactMessage != '' ||
              messageModel.replaySoundMessage != '' ||
              messageModel.replayRecordMessage != '')
            GestureDetector(
                onTap: () async {
                  // if (messageModel.replayMessageID != null) {
                  //   final originalMessage = messages.messages.firstWhere(
                  //     (element) =>
                  //         element.messageID == messageModel.replayMessageID,
                  //   );

                  //   int messageIndex = messages.messages.indexOf(originalMessage);

                  // }
                },
                child: ReplayMessageText(
                    size: size,
                    messageModel: messageModel,
                    messageTextColor: messageTextColor)),
          Text(messageModel.messageText,
              style: TextStyle(
                  color: (messageModel.messageText.startsWith('http') ||
                          messageModel.messageText.startsWith('https'))
                      ? messageModel.senderID !=
                              FirebaseAuth.instance.currentUser!.uid
                          ? const Color(0xff8dbceb)
                          : Colors.indigo.shade700
                      : messageTextColor)),
        ],
      ),
    );
  }
}
