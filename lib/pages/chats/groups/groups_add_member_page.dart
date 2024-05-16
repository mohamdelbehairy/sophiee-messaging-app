import 'package:sophiee/constants.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_members_page/groups_chat_add_members/groups_add_member_page_body.dart';

class GroupsAddMemberPage extends StatelessWidget {
  const GroupsAddMemberPage(
      {super.key,
      required this.size,
      required this.groupModel,
      required this.isDark});
  final Size size;
  final GroupModel groupModel;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Add members',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.normal),
        ),
      ),
      body: GroupsAddMemberPageBody(size: size, groupModel: groupModel,isDark: isDark),
    );
  }
}
