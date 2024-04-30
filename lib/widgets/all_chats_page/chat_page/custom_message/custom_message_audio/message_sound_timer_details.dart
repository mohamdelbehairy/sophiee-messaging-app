import 'package:sophiee/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageSoundTimerDetails extends StatelessWidget {
  const MessageSoundTimerDetails(
      {super.key,
      required this.size,
      required this.firstTimer,
      required this.lastTimer,
      required this.message});

  final Size size;
  final String firstTimer;
  final String lastTimer;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .6,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(firstTimer,
                style: TextStyle(
                    fontSize: size.width * .025,
                    color: message.senderID ==
                            FirebaseAuth.instance.currentUser!.uid
                        ? Colors.white
                        : Colors.grey)),
            Text(lastTimer,
                style: TextStyle(
                    fontSize: size.width * .025,
                    color: message.senderID ==
                            FirebaseAuth.instance.currentUser!.uid
                        ? Colors.white
                        : Colors.grey))
          ],
        ),
      ),
    );
  }
}
