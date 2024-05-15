import 'package:flutter/material.dart';

import '../../../../../models/group_model.dart';
import '../../../../../pages/chats/groups/groups_chat_page/groups_chat_media_fiels_page.dart';
import 'groups_chat_component.dart';
import 'package:get/get.dart' as getnav;

class GroupsMediaFiles extends StatelessWidget {
  const GroupsMediaFiles(
      {super.key,
      required this.size,
      required this.isDark,
      required this.groupData});

  final Size size;
  final bool isDark;
  final GroupModel groupData;

  @override
  Widget build(BuildContext context) {
    return GroupsChatComponent(
        size: size,
        isDark: isDark,
        componentName: 'Media fiels',
        onTap: () => getnav.Get.to(
            () => GroupsChatMediaFilesPage(groupModel: groupData, size: size),
            transition: getnav.Transition.rightToLeft));
  }
}
