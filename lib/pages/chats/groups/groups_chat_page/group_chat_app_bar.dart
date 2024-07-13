import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/utils/initial_state.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chats_icons_app_bar_button.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_app_bar.dart';

import '../../../../constants.dart';
import '../../../../models/group_model.dart';

AppBar groupChatAppBar(
    {required bool isDark,
    required BuildContext context,
    required GroupModel? groupModel,
    required String groupID,
    required Size size}) {
  return AppBar(
      titleSpacing: -8,
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: GroupsChatPageAppBar(
          groupModel: groupModel, groupID: groupID, isDark: isDark, size: size),
      actions: const [
        ChatsIconsAppBarButton(icon: Icons.call),
        SizedBox(width: 16),
        ChatsIconsAppBarButton(icon: FontAwesomeIcons.video),
        SizedBox(width: 16),
        ChatsIconsAppBarButton(icon: Icons.error)
      ],
      leading: GestureDetector(
          onTap: () {
            InitialState.initPickContactState(context);
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back, color: Colors.white)));
}
