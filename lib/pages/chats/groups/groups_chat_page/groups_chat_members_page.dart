import 'package:sophiee/constants.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_members_page/groups_chat_members_page_body.dart';
import 'package:flutter/material.dart';

class GroupsChatMembersPage extends StatelessWidget {
  const GroupsChatMembersPage(
      {super.key,
      required this.groupModel,
      required this.isDark,
      required this.size});
  final GroupModel groupModel;
  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: kPrimaryColor,
            title: const Text('Actions',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400))),
        body: GroupsChatMembersPageBody(
            size: size, groupModel: groupModel, isDark: isDark));
  }
}
