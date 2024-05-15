import 'package:flutter/material.dart';
import 'package:get/get.dart' as getnav;

import '../../../../../models/group_model.dart';
import '../../../../../pages/chats/groups/groups_chat_page/groups_chat_members_page.dart';
import 'groups_chat_component.dart';

class GroupsMembers extends StatelessWidget {
  const GroupsMembers(
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
        componentName: 'Group Members',
        onTap: () => getnav.Get.to(
            () => GroupsChatMembersPage(groupModel: groupData),
            transition: getnav.Transition.rightToLeft));
  }
}
