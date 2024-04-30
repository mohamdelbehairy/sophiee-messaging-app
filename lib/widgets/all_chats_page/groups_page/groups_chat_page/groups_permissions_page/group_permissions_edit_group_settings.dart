import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_permissions_page/custom_edit_group_settings_switch.dart';
import 'package:flutter/material.dart';

class GroupPermissionsEditGroupSettingsMembers extends StatelessWidget {
  const GroupPermissionsEditGroupSettingsMembers(
      {super.key,
      required this.size,
      required this.isDark,
      required this.groupModel});

  final Size size;
  final bool isDark;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.edit, color: Colors.grey, size: size.height * .025),
        SizedBox(width: size.width * .035),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomEditGroupSettingsSwitch(
                size: size, isDark: isDark, groupModel: groupModel),
            Text(
                'This includes the\n name, icon,description,\ndisappearing message\n timer,and the ability to pin,\nkeep or unkeep messages.',
                style:
                    TextStyle(color: Colors.grey, fontSize: size.width * .035))
          ],
        )
      ],
    );
  }
}
