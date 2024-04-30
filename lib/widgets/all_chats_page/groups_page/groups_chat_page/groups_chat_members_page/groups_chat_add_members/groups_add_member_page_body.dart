import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_state.dart';
import 'package:sophiee/cubit/groups/groups_members_details/groups_members_details_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_members_page/groups_chat_add_members/groups_add_memeber_list_view.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_members_page/groups_chat_add_members/groups_chat_add_member_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsAddMemberPageBody extends StatelessWidget {
  const GroupsAddMemberPageBody(
      {super.key, required this.size, required this.groupModel});
  final Size size;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    var groupsMemberSelected = context.read<GroupsMemberSelectedCubit>();
    var addGroupsMember = context.read<GroupsMembersDetailsCubit>();
    groupsMemberSelected.getGroupsMemberSelectedFriends();
    return SafeArea(
      child: SizedBox(
        height: size.height,
        child:
            BlocBuilder<GroupsMemberSelectedCubit, GroupsMemberSelectedState>(
          builder: (context, state) {
            return Column(
              children: [
                GroupsAddMembersListView(size: size, groupModel: groupModel),
                if (groupsMemberSelected
                    .getGroupsMemberSelectedFriendsList.isNotEmpty)
                  GroupsChatAddMemberButton(
                      size: size,
                      onTap: () async {
                        Navigator.pop(context);
                        await addGroupsMember.addGroupMember(
                            groupID: groupModel.groupID,
                            memberID: groupsMemberSelected
                                .getGroupsMemberSelectedFriendsList);
                        for (var friend in groupsMemberSelected
                            .getGroupsMemberSelectedFriendsList) {
                          groupsMemberSelected
                              .deleteGroupsMemberSelectedFriends(
                                  selectedFriendID: friend);
                        }
                      }),
              ],
            );
          },
        ),
      ),
    );
  }
}
