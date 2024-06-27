import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../models/group_model.dart';
import '../groups_chat_page/custom_pop_menu_button.dart';
import '../groups_image_cover/group_image_cover.dart';
import 'groups_member_image_cover.dart';

class CustomMyGroupsBody extends StatelessWidget {
  const CustomMyGroupsBody(
      {super.key,
      required this.isDark,
      required this.size,
      required this.groupModel});

  final bool isDark;
  final Size size;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? cardDarkModeBackground : Colors.white,
      elevation: isDark ? 1 : 0,
      child: Padding(
        padding: EdgeInsets.only(left: size.width * .02),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.star, color: Colors.amber),
                CustomPopMenuButton(size: size, groupModel: groupModel)
              ],
            ),
            GroupsCoverImage(
                groupModel: groupModel, isDark: isDark, size: size),
            SizedBox(height: size.width * .01),
            Text(groupModel.groupName,
            maxLines: 1,
                style: TextStyle(color: isDark ? Colors.white : Colors.black)),
            SizedBox(height: size.width * .01),
            GroupsMemberImageCover(
                groupModel: groupModel, isDark: isDark, size: size)
          ],
        ),
      ),
    );
  }
}
