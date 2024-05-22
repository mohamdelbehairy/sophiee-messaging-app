import 'dart:io';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_pick_items/groups_chat_pick_file_page_body.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class GroupsChatPickFilePage extends StatelessWidget {
  const GroupsChatPickFilePage(
      {super.key,
      required this.file,
      required this.groupModel,
      required this.replayTextMessage,
      required this.replayImageMessage,
      required this.replayFileMessage,
      required this.friendNameReplay,
      required this.replayMessageID,
      required this.replayContactMessage,
      required this.replaySoundMessage,
      required this.replayRecordMessage,
      required this.tokens,
      required this.senderName,
      required this.isNotify});
  final File file;
  final GroupModel groupModel;
  final String replayTextMessage;
  final String replayImageMessage;
  final String replayFileMessage;
  final String friendNameReplay;
  final String replayMessageID;
  final String replayContactMessage;
  final String replaySoundMessage;
  final String replayRecordMessage;
  final List<String> tokens;
  final String senderName;
  final List<bool> isNotify;

  @override
  Widget build(BuildContext context) {
    String fileName = path.basename(file.path);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: size.width * -.02,
        backgroundColor: const Color(0xff000101),
        title: Text(
          fileName,
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height * .03,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: GroupsChatPickFilePageBody(
          isNotify: isNotify,
          senderName: senderName,
          tokens: tokens,
          replayContactMessage: replayContactMessage,
          replayFileMessage: replayFileMessage,
          replayImageMessage: replayImageMessage,
          replayMessageID: replayMessageID,
          replayTextMessage: replayTextMessage,
          friendNameReplay: friendNameReplay,
          replaySoundMessage: replaySoundMessage,
          replayRecordMessage: replayRecordMessage,
          file: file,
          messageFileName: fileName,
          groupModel: groupModel),
    );
  }
}
