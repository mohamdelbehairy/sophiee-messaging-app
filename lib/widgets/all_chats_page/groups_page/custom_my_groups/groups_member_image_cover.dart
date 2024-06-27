import 'package:flutter/material.dart';
import '../../../../models/group_model.dart';
import 'custom_member_image_cover.dart';

class GroupsMemberImageCover extends StatelessWidget {
  const GroupsMemberImageCover(
      {super.key,
      required this.groupModel,
      required this.isDark,
      required this.size});

  final GroupModel groupModel;
  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < groupModel.usersID.length; i++)
          CustomMemberImageCover(
              size: size, isDark: isDark, groupModel: groupModel, i: i)
      ],
    );
  }
}

