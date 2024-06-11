import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_friend_info_bottom_sheet/chat_page_friend_info_bottom_sheet_details.dart';
import 'package:flutter/material.dart';

import 'chat_page_divider.dart';
import 'chat_page_friend_info.dart';
import 'chat_page_friend_list_tile.dart';

class ChatPageFriendInfoBottomSheetBody extends StatelessWidget {
  const ChatPageFriendInfoBottomSheetBody(
      {super.key,
      required this.size,
      required this.user,
      required this.isDark});
  final Size size;
  final UserModel user;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatPageDivider(size: size),
        ChatPageFriendListTile(user: user),
        SizedBox(height: size.height * .025),
        const ChatPageFriendInfo(),
        ChatPageFriendInfoBottomSheetDetails(
            size: size, user: user, isDark: isDark)
      ],
    );
  }
}
