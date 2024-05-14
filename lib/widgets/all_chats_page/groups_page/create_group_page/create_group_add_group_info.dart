import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_add_group_image.dart';
import 'package:flutter/material.dart';

import '../../../create_accont_widget/add_user_text_filed.dart';

class CreateGroupAddGroupInfo extends StatelessWidget {
  const CreateGroupAddGroupInfo(
      {super.key,
      required this.groupNameController,
      required this.descriptionController,
      required this.size});
  final TextEditingController groupNameController;
  final TextEditingController descriptionController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18, right: 18, top: size.height * .02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CreateGroupAddGroupImage(),
          AddUserTextField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'group name is required';
                } else {
                  return null;
                }
              },
              enabled: true,
              size: size,
              hintText: 'Group name',
              controller: groupNameController),
          AddUserTextField(
              enabled: true,
              size: size,
              hintText: 'Group description(optional)',
              controller: descriptionController)
        ],
      ),
    );
  }
}
