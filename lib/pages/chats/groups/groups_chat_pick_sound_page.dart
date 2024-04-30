import 'dart:io';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_pick_sound_button.dart';
import 'package:sophiee/utils/widget/chats/pick_sound_page_body.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class GroupsChatPickSoundPage extends StatelessWidget {
  const GroupsChatPickSoundPage(
      {super.key,
      required this.sound,
      required this.size,
      required this.groupModel,
      required this.replayTextMessage,
      required this.replayImageMessage,
      required this.replayFileMessage,
      required this.friendNameReplay,
      required this.replayMessageID,
      required this.replayContactMessage,
      required this.replaySoundMessage,
      required this.replayRecordMessage});
  final File sound;
  final Size size;
  final GroupModel groupModel;
  final String replayTextMessage;
  final String replayImageMessage;
  final String replayFileMessage;
  final String friendNameReplay;
  final String replayMessageID;
  final String replayContactMessage;
  final String replaySoundMessage;
  final String replayRecordMessage;

  @override
  Widget build(BuildContext context) {
    String soundName = path.basename(sound.path);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        titleSpacing: size.width * -.02,
        backgroundColor: const Color(0xff000101),
        title: Text(
          soundName,
          style: TextStyle(
              color: Colors.white,
              fontSize: size.height * .025,
              fontWeight: FontWeight.normal),
        ),
      ),
      body: Stack(
        children: [
          PickSoundPageBody(size: size, file: sound),
          GroupsChatPickSoundButton(
              replayContactMessage: replayContactMessage,
              replayFileMessage: replayFileMessage,
              replayImageMessage: replayImageMessage,
              replayMessageID: replayMessageID,
              replayTextMessage: replayTextMessage,
              friendNameReplay: friendNameReplay,
              replaySoundMessage: replaySoundMessage,
              replayRecordMessage: replayRecordMessage,
              size: size,
              sound: sound,
              groupModel: groupModel,
              audioName: soundName),
        ],
      ),
    );
  }
}
