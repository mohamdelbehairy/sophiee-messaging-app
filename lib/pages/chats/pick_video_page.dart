import 'dart:io';

import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_video_page/pick_video_page_body.dart';
import 'package:flutter/material.dart';

class PickVideoPage extends StatelessWidget {
  const PickVideoPage({super.key, required this.video, required this.user});
  final File video;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: PickVideoPageBody(video: video, user: user),
    );
  }
}
