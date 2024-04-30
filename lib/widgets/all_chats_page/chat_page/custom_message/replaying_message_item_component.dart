import 'package:sophiee/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReplayingMessageItemComponent extends StatelessWidget {
  const ReplayingMessageItemComponent(
      {super.key,
      required this.messageModel,
      required this.size,
      required this.messageTextColor,
      required this.width});

  final MessageModel messageModel;
  final Size size;
  final Color messageTextColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.only(
            left: messageModel.replayTextMessage != '' ||
                    messageModel.replayImageMessage != null
                ? size.width * .015
                : 0.0,
            top:
                messageModel.replayTextMessage != '' ? size.height * .001 : 0.0,
            bottom: messageModel.replayTextMessage != '' ||
                    messageModel.replayImageMessage != ''
                ? size.height * .005
                : 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (messageModel.friendNameReplay != '')
              Text(
                  messageModel.senderID ==
                          FirebaseAuth.instance.currentUser!.uid
                      ? 'you'
                      : messageModel.friendNameReplay!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: messageTextColor,
                      fontWeight: messageModel.senderID ==
                              FirebaseAuth.instance.currentUser!.uid
                          ? FontWeight.w300
                          : FontWeight.w900)),
            Text(
                messageModel.replayRecordMessage != ''
                    ? 'Record'
                    : messageModel.replaySoundMessage != ''
                        ? messageModel.replaySoundMessage!
                        : messageModel.replayTextMessage != ''
                            ? messageModel.replayTextMessage!
                            : messageModel.replayImageMessage != ''
                                ? 'Photo'
                                : messageModel.replayFileMessage != ''
                                    ? messageModel.replayFileMessage!
                                    : messageModel.replayContactMessage != null
                                        ? messageModel.replayContactMessage!
                                        : '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: messageModel.senderID ==
                            FirebaseAuth.instance.currentUser!.uid
                        ? Colors.white70
                        : Colors.grey)),
          ],
        ),
      ),
    );
  }
}
