import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_edit/groups_chat_edit_image.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_edit/groups_chat_edit_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      padding: EdgeInsets.symmetric(
          vertical: size.height * .01, horizontal: size.height * .02),
      child: Column(
        children: [
          Row(
            children: [
              GroupsChatEditImage(groupModel: groupModel),
              SizedBox(width: size.width * .04),
              Expanded(
                  child: GroupsChatEditTextField(
                      controller: groupNameController, hintText: 'group name')),
            ],
          ),
          SizedBox(
              height: size.height * .1,
              width: size.width,
              child: GroupsChatEditTextField(
                  controller: descriptionController,
                  hintText: 'group description'))
        ],
      ),
    );
  }
}
