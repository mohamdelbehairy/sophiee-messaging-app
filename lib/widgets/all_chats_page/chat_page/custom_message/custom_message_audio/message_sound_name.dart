import 'package:sophiee/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageSoundName extends StatelessWidget {
  const MessageSoundName(
      {super.key, required this.size, required this.message, required this.nameColor});

  final Size size;
  final MessageModel message;
  final Color nameColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          message.replayFileMessage != '' ? size.width * .57 : size.width * .55,
      child: Text(
        message.messageSoundName!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: nameColor,
            fontSize: size.width * .03),
      ),
    );
  }
}
