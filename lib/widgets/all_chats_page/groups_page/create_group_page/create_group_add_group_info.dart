import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_add_group_image.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_add_group_text_field.dart';
import 'package:flutter/material.dart';

class CreateGroupAddGroupInfo extends StatelessWidget {
  const CreateGroupAddGroupInfo(
      {super.key,
      required this.groupNameController,
      required this.descriptionController});
  final TextEditingController groupNameController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // var isDark = context.read<LoginCubit>().isDark;
    return Container(
      height: size.height * .2,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(.1),
            spreadRadius: 40,
            blurRadius: 40),
      ]),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width * .02)),
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * .025,
              right: size.width * .05,
              top: size.height * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CreateGroupAddGroupImage(),
                  SizedBox(width: size.width * .04),
                  CreateGroupAddGroupTextField(
                    controller: groupNameController,
                    hintText: 'Group name',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'group name is required';
                      } else {
                        return null;
                      }
                    },
                  )
                ],
              ),
              SizedBox(height: size.width * .02),
              CreateGroupAddGroupTextField(
                  controller: descriptionController,
                  hintText: 'Group description(optional)')
            ],
          ),
        ),
      ),
    );
  }
}
