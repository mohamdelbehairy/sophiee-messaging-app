import 'package:sophiee/cubit/groups/get_groups_member/get_groups_member_cubit.dart';
import 'package:sophiee/cubit/groups/get_groups_member/get_groups_member_state.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_members_page/groups_chat_members_page_list_view.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_members_page/groups_chat_add_members/groups_chat_page_add_member_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsChatMembersPageBody extends StatelessWidget {
  const GroupsChatMembersPageBody(
      {super.key,
      required this.size,
      required this.groupModel,
      required this.isDark});
  final Size size;
  final GroupModel groupModel;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    context.read<GroupsMemberSelectedCubit>().getGroupsMemberSelectedFriends();
    return BlocBuilder<GetGroupsMemberCubit, GetGroupsMemberState>(
      builder: (context, state) {
        if (state is GetGroupsMemberSuccess && state.groupsList.isNotEmpty) {
          final groupID = groupModel.groupID;
          final groupData = state.groupsList
              .firstWhere((element) => element.groupID == groupID);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 14, left: 14, top: 10),
                  child: Text('All Members',
                      style: TextStyle(
                          color:
                              isDark ? Colors.white70 : const Color(0xff85889f),
                          fontWeight: FontWeight.normal,
                          fontSize: size.height * .015))),
              if (groupData.isAddFriends ||
                  groupData.groupOwnerID ==
                      FirebaseAuth.instance.currentUser!.uid ||
                  groupData.adminsID
                      .contains(FirebaseAuth.instance.currentUser!.uid))
                const SizedBox(height: 8),
              if (groupData.isAddFriends ||
                  groupData.groupOwnerID ==
                      FirebaseAuth.instance.currentUser!.uid ||
                  groupData.adminsID
                      .contains(FirebaseAuth.instance.currentUser!.uid))
                GroupsChatPageAddMemberItem(
                    size: size, groupModel: groupData, isDark: isDark),
              GroupsChatMembersPageListView(
                  groupModel: groupData, size: size, isDark: isDark),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
