import 'package:sophiee/constants.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_custom_message/groups_chat_custom_message_component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GroupsChatCustomMessageComponentBody extends StatelessWidget {
  const GroupsChatCustomMessageComponentBody(
      {super.key,
      required this.groupModel,
      required this.message,
      required this.size});

  final GroupModel groupModel;
  final MessageModel message;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GroupsChatCustomMessageComponenet(
        groupModel: groupModel,
        message: message,
        isSeen: message.isSeen,
        alignment: message.senderID == FirebaseAuth.instance.currentUser!.uid
            ? Alignment.centerRight
            : Alignment.centerLeft,
        backGroundMessageColor:
            message.senderID == FirebaseAuth.instance.currentUser!.uid
                ? kPrimaryColor
                : const Color(0xfff0fafe),
        bottomLeft: message.senderID == FirebaseAuth.instance.currentUser!.uid
            ? Radius.circular(size.width * .03)
            : const Radius.circular(0),
        bottomRight: message.senderID == FirebaseAuth.instance.currentUser!.uid
            ? const Radius.circular(0)
            : Radius.circular(size.width * .03),
        messageTextColor:
            message.senderID == FirebaseAuth.instance.currentUser!.uid
                ? Colors.white
                : Colors.black);
  }
}
