import 'dart:io';

import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_pick_items/groups_chat_pick_image_page_body.dart';
import 'package:flutter/material.dart';

class GroupsChatPickImagePage extends StatelessWidget {
  const GroupsChatPickImagePage(
      {super.key,
      required this.image,
      required this.groupModel,
      required this.replayTextMessage,
      required this.replayImageMessage,
      required this.replayFileMessage,
      required this.replayContactMessage,
      required this.friendNameReplay,
      required this.replayMessageID,
      required this.replaySoundMessage,
      required this.replayRecordMessage});
  final File image;
  final GroupModel groupModel;
  final String replayTextMessage;
  final String replayImageMessage;
  final String replayFileMessage;
  final String replayContactMessage;
  final String friendNameReplay;
  final String replayMessageID;
  final String replaySoundMessage;
  final String replayRecordMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GroupsChatPickImagePageBody(
        image: image,
        groupModel: groupModel,
        replayTextMessage: replayTextMessage,
        friendNameReplay: friendNameReplay,
        replayImageMessage: replayImageMessage,
        replayFileMessage: replayFileMessage,
        replayContactMessage: replayContactMessage,
        replayMessageID: replayMessageID,
        replaySoundMessage: replaySoundMessage,
        replayRecordMessage: replayRecordMessage,
      ),
    );
  }
}
