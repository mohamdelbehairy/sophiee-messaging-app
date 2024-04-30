import 'package:sophiee/cubit/groups/group_permissions/group_permissions_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_permissions_page/group_permissions_basic_text.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_permissions_page/member_permissions_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminSettings extends StatelessWidget {
  const AdminSettings(
      {super.key,
      required this.isDark,
      required this.size,
      required this.groupModel});
  final bool isDark;
  final Size size;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    var updateGroupPermissions = context.read<GroupPermissionsCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GroupPermissionsBasicText(
            isDark: isDark, size: size, basicText: 'Admins can:'),
        SizedBox(height: size.width * .05),
        MemberPermissionsItem(
            onChanged: (value) async {
              await updateGroupPermissions.updateGroupPermission(
                  groupID: groupModel.groupID,
                  fieldName: 'isDeleteMessage',
                  fieldValue: value);
            },
            value: groupModel.isDeleteMessage,
            text: 'Delete messages',
            icon: Icons.delete_forever,
            size: size,
            isDark: isDark,
            groupModel: groupModel),
        SizedBox(height: size.width * .09),
        MemberPermissionsItem(
            onChanged: (value) async {
              await updateGroupPermissions.updateGroupPermission(
                  groupID: groupModel.groupID,
                  fieldName: 'isRemoveMember',
                  fieldValue: value);
            },
            value: groupModel.isRemoveMember,
            text: 'Remove members',
            icon: Icons.person_remove,
            size: size,
            isDark: isDark,
            groupModel: groupModel),
      ],
    );
  }
}
