import 'package:sophiee/cubit/groups/group_permissions/group_permissions_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_permissions_page/custom_switch_icon.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_permissions_page/custom_text_title_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomEditGroupSettingsSwitch extends StatelessWidget {
  const CustomEditGroupSettingsSwitch(
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
    return SizedBox(
      width: size.width * .8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextTitleSwitch(
              isDark: isDark, size: size, title: 'Edit group settings'),
          CustomSwitchIcon(
              size: size,
              value: groupModel.isMemberSettings,
              onChanged: (value) async {
                await updateGroupPermission.updateGroupPermission(
                    fieldName: 'isMemberSettings',
                    groupID: groupModel.groupID,
                    fieldValue: value);
              })
        ],
      ),
    );
  }
}
