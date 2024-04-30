import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_audio/custom_message_sound_component.dart';
import 'package:sophiee/utils/widget/messages/message_sound_length.dart';
import 'package:flutter/material.dart';

class CustomMessageSoundBody extends StatelessWidget {
  const CustomMessageSoundBody(
      {super.key,
      required this.message,
      required this.size,
      required this.user,
      required this.backgroungColor, required this.iconColor});

  final MessageModel message;
  final Size size;
  final UserModel user;
  final Color backgroungColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: message.messageSoundPlaying == false
          ? size.height * .08
          : size.height * .09,
      width: size.width * .72,
      child: Padding(
        padding: EdgeInsets.only(left: size.width * .025),
        child: Stack(
          children: [
            CustomMessageSoundComponent(
              iconColor: iconColor,
                backgroungColor: backgroungColor,
                message: message,
                size: size,
                user: user),
            if (message.messageSoundPlaying == false)
              MessageSoundLength(size: size, message: message,color: backgroungColor),
          ],
        ),
      ),
    );
  }
}
