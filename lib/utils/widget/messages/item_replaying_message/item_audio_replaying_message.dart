import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/models/message_model.dart';

class ItemAudioReplayingMessage extends StatelessWidget {
  const ItemAudioReplayingMessage(
      {super.key, required this.size, required this.messageModel});
  final Size size;
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: size.width * .013,
          right: size.width * .005,
          top: size.width * .01),
      child: CircleAvatar(
        radius: size.width * .038,
        backgroundColor:
            messageModel.senderID == FirebaseAuth.instance.currentUser!.uid
                ? Colors.white
                : kPrimaryColor,
        child: Icon(
            messageModel.replayRecordMessage != ''
                ? FontAwesomeIcons.microphone
                : Icons.music_note,
            color:
                messageModel.senderID == FirebaseAuth.instance.currentUser!.uid
                    ? kPrimaryColor
                    : Colors.white,
            size: size.width * .04),
      ),
    );
  }
}
