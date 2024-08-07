import 'package:flutter/material.dart';

import '../../../../models/users_model.dart';
import 'chat_page_friend_info_bottom.dart';
import 'chat_page_friend_info_list_tile.dart';

class ChatPageFriendListTile extends StatelessWidget {
  const ChatPageFriendListTile(
      {super.key, required this.user, required this.userData});

  final UserModel user, userData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ChatPageFriendInfoListTile(user: user, userData: userData),
        ChatPageFriendInfoBottom(user: user)
      ],
    );
  }
}
