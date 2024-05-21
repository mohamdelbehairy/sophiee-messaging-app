import 'dart:io';

import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_pick_items/groups_chat_pick_video_page_body.dart';
import 'package:flutter/material.dart';

class GroupsChatPickVideoPage extends StatelessWidget {
  const GroupsChatPickVideoPage(
      {super.key,
      required this.video,
      required this.groupModel,
      required this.tokens,
      required this.senderName, required this.isNotify});
  final File video;
  final GroupModel groupModel;
  final List<String> tokens;
  final String senderName;
  final List<bool> isNotify;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GroupsChatPickVideoPageBody(
        isNotify: isNotify,
          video: video,
          groupModel: groupModel,
          tokens: tokens,
          senderName: senderName),
    );
  }
}
