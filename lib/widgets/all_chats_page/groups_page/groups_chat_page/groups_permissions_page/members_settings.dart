import 'package:sophiee/cubit/groups/group_permissions/group_permissions_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_permissions_page/member_permissions_item.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_permissions_page/group_permissions_basic_text.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_permissions_page/group_permissions_edit_group_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MembersSetting extends StatelessWidget {
  const MembersSetting(
      {super.key,
      required this.size,
      required this.isDark,
      required this.groupModel});
  final Size size;
  final bool isDark;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    var updateGroupPermission = context.read<GroupPermissionsCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GroupPermissionsBasicText(
            isDark: isDark, size: size, basicText: 'Members can:'),
        SizedBox(height: size.width * .05),
        GroupPermissionsEditGroupSettingsMembers(
            size: size, isDark: isDark, groupModel: groupModel),
        SizedBox(height: size.width * .09),
        MemberPermissionsItem(
            onChanged: (value) async {
              await updateGroupPermission.updateGroupPermission(
                  fieldName: 'isSendMessages',
                  groupID: groupModel.groupID,
                  fieldValue: value);
            },
            value: groupModel.isSendMessages,
            text: 'Send messages',
            icon: Icons.chat,
            size: size,
            isDark: isDark,
            groupModel: groupModel),
        SizedBox(height: size.width * .09),
        MemberPermissionsItem(
            onChanged: (value) async {
              await updateGroupPermission.updateGroupPermission(
                  fieldName: 'isAddFriends',
                  groupID: groupModel.groupID,
                  fieldValue: value);
            },
            value: groupModel.isAddFriends,
            text: 'Add other members',
            icon: Icons.person_add,
            size: size,
            isDark: isDark,
            groupModel: groupModel),
      ],
    );
  }
}
