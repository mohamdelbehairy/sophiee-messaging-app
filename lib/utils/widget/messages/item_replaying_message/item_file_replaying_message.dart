import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/models/message_model.dart';

class ItemsFileReplayingMessage extends StatelessWidget {
  const ItemsFileReplayingMessage(
      {super.key, required this.size, required this.message});

  final Size size;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: size.width * .015, top: size.width * .025),
      child: CircleAvatar(
        radius: size.width * .038,
        backgroundColor:
            message.senderID == FirebaseAuth.instance.currentUser!.uid
                ? Colors.white
                : kPrimaryColor,
        child: Icon(Icons.insert_drive_file,
            color: message.senderID == FirebaseAuth.instance.currentUser!.uid
                ? kPrimaryColor
                : Colors.white,
            size: size.width * .04),
      ),
    );
  }
}
