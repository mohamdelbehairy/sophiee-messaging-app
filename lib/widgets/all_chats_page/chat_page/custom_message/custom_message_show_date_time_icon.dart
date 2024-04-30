import 'package:sophiee/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomMessageShowDataTimeIcons extends StatelessWidget {
  const CustomMessageShowDataTimeIcons(
      {super.key,
      required this.message,
      required this.isSeen,
      required this.messageTextColor});
  final MessageModel message;
  final bool isSeen;
  final Color messageTextColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message.formattedTime(),
            style: TextStyle(
                fontSize: size.width * .025,
                color:
                    message.messageImage != null && message.messageText == '' ||
                            message.messageVideo != null &&
                                message.messageText == ''
                        ? Colors.white
                        : messageTextColor)),
        SizedBox(width: size.width * .0001),
        if (message.senderID == FirebaseAuth.instance.currentUser!.uid)
          Icon(isSeen ? Icons.done_all : Icons.done,
              size: size.width * .04, color: messageTextColor)
      ],
    );
  }
}
