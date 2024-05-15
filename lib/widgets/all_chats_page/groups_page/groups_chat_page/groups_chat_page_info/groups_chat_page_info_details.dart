import 'package:sophiee/cubit/groups/get_groups_member/get_groups_member_cubit.dart';
import 'package:sophiee/cubit/groups/get_groups_member/get_groups_member_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_info/groups_chat_page_created_info.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_info/groups_chat_page_info_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import 'groups_high_lights.dart';
import 'groups_media_files.dart';
import 'groups_members.dart';

class GroupsChatPageInfoDetails extends StatelessWidget {
  const GroupsChatPageInfoDetails(
      {super.key,
      required this.groupModel,
      required this.user,
      required this.size,
      required this.isDark});
  final GroupModel groupModel;
  final UserModel user;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        color: isDark ? kDarkModeBackgroundColor : kLightModeBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 6),
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
                    GroupsChatPageInfoListTile(
                        groupModel: groupData, isDark: isDark, size: size),
                    const SizedBox(height: 6),
                    GroupsChatPageCreatedInfo(size: size, groupData: groupData),
                    Divider(thickness: 2, color: Colors.grey.withOpacity(.1)),
                    GroupsMembers(
                        size: size, isDark: isDark, groupData: groupData),
                    GroupsHighlights(
                        size: size,
                        isDark: isDark,
                        groupModel: groupModel,
                        groupData: groupData),
                    GroupsMediaFiles(
                        size: size, isDark: isDark, groupData: groupData),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
