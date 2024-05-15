import 'package:flutter/material.dart';

import '../../../../models/users_model.dart';
import '../../../../pages/chats/chat_media_files_page.dart';
import 'chat_page_friend_info_connection.dart';
import 'package:get/get.dart' as getnav;

class MediaFilesBottomSheet extends StatelessWidget {
  const MediaFilesBottomSheet(
      {super.key, required this.size, required this.user});

  final Size size;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ChatPageFriendInfoConnection(
        text: 'Media files',
        iconColor: Colors.blue,
        icon: Icons.perm_media,
        onTap: () => getnav.Get.to(
            () => ChatMediaFilesPage(size: size, user: user),
            transition: getnav.Transition.rightToLeft));
  }
}
