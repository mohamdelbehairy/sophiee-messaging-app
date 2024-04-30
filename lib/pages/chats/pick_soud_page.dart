import 'dart:io';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/chats/pick_sound_page_body.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_sound_page/pick_sound_page_button.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class PickSoundPage extends StatelessWidget {
  const PickSoundPage(
      {super.key,
      required this.size,
      required this.file,
      required this.user,
      required this.friendNameReplay,
      required this.replayTextMessage,
      required this.replayMessageID,
      required this.replayImageMessage,
      required this.replayFileMessage,
      required this.replayContactMessage,
      required this.replaySoundMessage,
      required this.replayRecordMessage});
  final Size size;
  final File file;
  final UserModel user;
  final String friendNameReplay;
  final String replayMessageID;
  final String replayTextMessage;
  final String replayImageMessage;
  final String replayFileMessage;
  final String replayContactMessage;
  final String replaySoundMessage;
  final String replayRecordMessage;

  @override
  Widget build(BuildContext context) {
    String soundName = path.basename(file.path);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          titleSpacing: size.width * -.02,
          backgroundColor: const Color(0xff000101),
          title: Text(soundName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height * .025,
                  fontWeight: FontWeight.normal))),
      body: Stack(
        children: [
          PickSoundPageBody(size: size, file: file),
          PickSoundPageButton(
            size: size,
            audioFile: file,
            audioName: soundName,
            user: user,
            friendNameReplay: friendNameReplay,
            replayMessageID: replayMessageID,
            replayTextMessage: replayTextMessage,
            replayImageMessage: replayImageMessage,
            replayFileMessage: replayFileMessage,
            replayContactMessage: replayContactMessage,
            replaySoundMessage: replaySoundMessage,
            replayRecordMessage: replayRecordMessage,
          ),
        ],
      ),
    );
  }
}
