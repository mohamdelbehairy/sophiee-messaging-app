import 'package:flutter/material.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../../../models/users_model.dart';
import '../../../../pages/chats/chat_media_files_page.dart';
import 'chat_page_friend_info_connection.dart';

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
        onTap: () => Navigation.push(
            context, ChatMediaFilesPage(size: size, user: user)));
  }
}
