import 'package:sophiee/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageDateTime extends StatelessWidget {
  const MessageDateTime(
      {super.key,
      required this.size,
      required this.message,
      required this.isSeen,
      required this.left});

  final Size size;
  final MessageModel message;
  final bool isSeen;
  final double left;

  @override
  Widget build(BuildContext context) {
    int differenceInMinutes =
        Timestamp.now().toDate().difference(message.messageDateTime).inMinutes;
    int differenceInHours =
        Timestamp.now().toDate().difference(message.messageDateTime).inHours;
    int differenceInDays =
        Timestamp.now().toDate().difference(message.messageDateTime).inDays;
    return Padding(
      padding: EdgeInsets.only(
          top: message.senderID != FirebaseAuth.instance.currentUser!.uid
              ? size.width * .01
              : 0,
          left: left,
          right: size.width * .03,
          bottom: size.width * .01),
      child: Row(
        mainAxisAlignment:
            message.senderID == FirebaseAuth.instance.currentUser!.uid
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
        children: [
          if (message.senderID == FirebaseAuth.instance.currentUser!.uid)
            Text(isSeen ? 'Seen' : 'Send',
                style: const TextStyle(color: Colors.grey)),
          SizedBox(width: size.width * .005),
          if (message.senderID == FirebaseAuth.instance.currentUser!.uid)
            const Text('.', style: TextStyle(color: Colors.black)),
          SizedBox(width: size.width * .005),
          Text(
              differenceInMinutes < 1
                  ? 'now'
                  : differenceInMinutes < 60
                      ? '$differenceInMinutes m'
                      : differenceInHours < 24
                          ? '$differenceInHours h'
                          : differenceInDays < 7
                              ? differenceInDays == 1
                                  ? '$differenceInDays d'
                                  : '$differenceInDays d'
                              : '$differenceInDays d',
              style: const TextStyle(color: Colors.grey)),
          if (message.senderID != FirebaseAuth.instance.currentUser!.uid)
            SizedBox(width: size.width * .01),
          if (message.senderID != FirebaseAuth.instance.currentUser!.uid)
            Icon(Icons.sms, color: Colors.grey, size: size.width * .04)
        ],
      ),
    );
  }
}
