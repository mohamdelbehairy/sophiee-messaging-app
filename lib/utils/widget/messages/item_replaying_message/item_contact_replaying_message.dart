import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/models/message_model.dart';

class ItemContactReplayingMessage extends StatelessWidget {
  const ItemContactReplayingMessage(
      {super.key, required this.size, required this.messageModel});

  final Size size;
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: size.width * .015, top: size.width * .025),
        child: CircleAvatar(
          radius: size.width * .04,
          backgroundColor:
              messageModel.senderID == FirebaseAuth.instance.currentUser!.uid
                  ? Colors.white
                  : kPrimaryColor,
          child: Icon(Icons.contact_phone,
              color: messageModel.senderID ==
                      FirebaseAuth.instance.currentUser!.uid
                  ? kPrimaryColor
                  : Colors.white,
              size: size.width * .045),
        ));
  }
}
