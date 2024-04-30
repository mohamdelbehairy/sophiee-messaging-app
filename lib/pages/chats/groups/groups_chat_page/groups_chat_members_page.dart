import 'package:sophiee/constants.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_members_page/groups_chat_members_page_body.dart';
import 'package:flutter/material.dart';

class GroupsChatMembersPage extends StatelessWidget {
  const GroupsChatMembersPage({super.key, required this.groupModel});
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          title: Text('Actions',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height * .03,
                  fontWeight: FontWeight.normal))),
      body: GroupsChatMembersPageBody(size: size, groupModel: groupModel),
    );
  }
}
