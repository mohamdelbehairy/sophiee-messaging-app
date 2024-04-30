import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_permissions_page/custom_switch_icon.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_permissions_page/custom_text_title_switch.dart';
import 'package:flutter/material.dart';

class MemberPermissionsItem extends StatelessWidget {
  const MemberPermissionsItem(
      {super.key,
      required this.size,
      required this.isDark,
      required this.groupModel,
      required this.icon,
      required this.text,
      required this.value,
      required this.onChanged});

  final Size size;
  final bool isDark;
  final GroupModel groupModel;
  final IconData icon;
  final String text;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.grey, size: size.height * .03),
            SizedBox(width: size.width * .035),
            CustomTextTitleSwitch(isDark: isDark, size: size, title: text)
          ],
        ),
        CustomSwitchIcon(size: size, onChanged: onChanged, value: value)
      ],
    );
  }
}
