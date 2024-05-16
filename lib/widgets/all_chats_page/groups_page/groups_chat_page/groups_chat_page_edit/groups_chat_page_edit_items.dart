import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_edit/groups_chat_edit_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sophiee/widgets/create_accont_widget/add_user_text_filed.dart';

class GroupsChatPageEditItems extends StatelessWidget {
  const GroupsChatPageEditItems(
      {super.key,
      required this.groupModel,
      required this.groupNameController,
      required this.descriptionController});
  final GroupModel groupModel;
  final TextEditingController groupNameController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
   
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: size.height * .01, horizontal: 16),
      child: Column(
        children: [
          GroupsChatEditImage(groupModel: groupModel),
          AddUserTextField(
              size: size,
              hintText: 'group name',
              controller: groupNameController,
              bottom: size.width * .03),
          AddUserTextField(
              size: size,
              hintText: 'group description',
              controller: descriptionController),
        ],
      ),
    );
  }
}
