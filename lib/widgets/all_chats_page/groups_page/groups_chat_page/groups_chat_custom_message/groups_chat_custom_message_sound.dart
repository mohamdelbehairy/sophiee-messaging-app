import 'package:sophiee/constants.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/messages/message_sound_length.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_custom_message/groups_chat_custom_message_sound_component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GroupsChatCustomMessageSound extends StatelessWidget {
  const GroupsChatCustomMessageSound(
      {super.key,
      required this.size,
      required this.message,
      required this.groupModel,
      required this.user, required this.nameColor});
  final Size size;
  final MessageModel message;
  final GroupModel groupModel;
  final UserModel user;
  final Color nameColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (message.senderID != FirebaseAuth.instance.currentUser!.uid &&
            message.messageImage == null &&
            message.messageVideo == null &&
            message.phoneContactNumber == null)
          Padding(
              padding: EdgeInsets.only(
                  left: size.width * .03, top: size.width * .03),
              child: Text(user.userName,
                  style: TextStyle(
                      fontSize: size.width * .035,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.normal))),
        SizedBox(
          height: message.messageSoundPlaying == false
              ? size.height * .08
              : size.height * .09,
          width: size.width * .72,
          child: Padding(
              padding: EdgeInsets.only(left: size.width * .025),
              child: Stack(
                children: [
                  GroupsChatCustomMessageSoundComponent(
                    nameColor: nameColor,
                      groupModel: groupModel, size: size, message: message),
                  if (message.messageSoundPlaying == false)
                    MessageSoundLength(
                        size: size,
                        message: message,
                        color: message.senderID ==
                                FirebaseAuth.instance.currentUser!.uid
                            ? Colors.white
                            : Colors.grey),
                ],
              )),
        ),
      ],
    );
  }
}
