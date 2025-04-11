import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../../../cubit/groups/get_groups_member/get_groups_member_cubit.dart';
import '../../../../cubit/groups/get_groups_member/get_groups_member_state.dart';
import '../../../../models/group_model.dart';
import '../../../../pages/chats/groups/groups_chat_page/groups_chat_page_info.dart';
import 'groups_chat_app_bar_body.dart';

class GroupsChatPageAppBar extends StatelessWidget {
  const GroupsChatPageAppBar(
      {super.key,
      required this.groupID,
      required this.isDark,
      required this.size,
      this.groupModel});
  final String groupID;
  final bool isDark;
  final Size size;
  final GroupModel? groupModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGroupsMemberCubit, GetGroupsMemberState>(
      builder: (context, state) {
        if (state is GetGroupsMemberSuccess && state.groupsList.isNotEmpty) {
          final groupData = state.groupsList
              .firstWhere((element) => element.groupID == groupID);
          return GestureDetector(
              onTap: () => Navigation.push(
                  context,
                  GroupsChatPageInfo(
                      groupModel: groupData, isDark: isDark, size: size)),
              child: GroupsChatAppBarBody(
                  isDark: isDark, groupData: groupData, size: size));
        } else {
          return GroupsChatAppBarBody(
              isDark: isDark, groupData: groupModel!, size: size);
        }
      },
    );
  }
}
