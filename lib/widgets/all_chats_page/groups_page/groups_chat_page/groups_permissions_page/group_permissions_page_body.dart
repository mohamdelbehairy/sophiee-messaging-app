import 'package:sophiee/cubit/groups/get_groups_member/get_groups_member_cubit.dart';
import 'package:sophiee/cubit/groups/get_groups_member/get_groups_member_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_permissions_page/admin_settings.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_permissions_page/members_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupPermissionsPageBody extends StatelessWidget {
  const GroupPermissionsPageBody(
      {super.key,
      required this.size,
      required this.groupModel,
      required this.isDark});

  final Size size;
  final GroupModel groupModel;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.height * .025, vertical: size.width * .03),
        child: BlocBuilder<GetGroupsMemberCubit, GetGroupsMemberState>(
          builder: (context, state) {
            if (state is GetGroupsMemberSuccess &&
                state.groupsList.isNotEmpty) {
              final groupID = groupModel.groupID;
              final groupData = state.groupsList
                  .firstWhere((element) => element.groupID == groupID);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MembersSetting(
                      size: size, isDark: isDark, groupModel: groupData),
                  SizedBox(height: size.width * .09),
                  AdminSettings(
                      isDark: isDark, size: size, groupModel: groupData),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
