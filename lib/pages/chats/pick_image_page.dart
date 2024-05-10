import 'dart:io';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_image_page_body.dart';
import 'package:flutter/material.dart';

class PickImagePage extends StatelessWidget {
  const PickImagePage(
      {super.key,
      required this.image,
      required this.user,
      required this.replayTextMessageImage,
      required this.replayImageMessageImage,
      required this.replayFileMessageImage,
      required this.replayContactMessageContact,
      required this.friendNameReplay,
      required this.replayMessageID,
      required this.replaySoundMessage,
      required this.replayRecordMessage});
  final File image;
  final UserModel user;
  final String replayTextMessageImage;
  final String replayImageMessageImage;
  final String replayFileMessageImage;
  final String replayContactMessageContact;
  final String friendNameReplay;
  final String replayMessageID;
  final String replaySoundMessage;
  final String replayRecordMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PickImagePageBody(
          replayMessageID: replayMessageID,
          friendNameReplay: friendNameReplay,
          image: image,
          user: user,
          replayTextMessageImage: replayTextMessageImage,
          replayImageMessageImage: replayImageMessageImage,
          replayFileMessageFile: replayFileMessageImage,
          replayContactMessageContact: replayContactMessageContact,
          replaySoundMessage: replaySoundMessage,
          replayRecordMessage: replayRecordMessage),
    );
  }
}
