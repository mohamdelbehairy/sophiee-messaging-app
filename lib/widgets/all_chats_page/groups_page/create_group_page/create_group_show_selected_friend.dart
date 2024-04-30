import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_state.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/friends_selected_list_view_horz_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupShowSelectedFriend extends StatelessWidget {
  const CreateGroupShowSelectedFriend(
      {super.key, required this.groupsMembersSelected, required this.size});

  final GroupsMemberSelectedCubit groupsMembersSelected;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupsMemberSelectedCubit, GroupsMemberSelectedState>(
      builder: (context, state) {
        if (groupsMembersSelected
            .getGroupsMemberSelectedFriendsList.isNotEmpty) {
          return SizedBox(
            height: size.height * .1,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: groupsMembersSelected
                    .getGroupsMemberSelectedFriendsList.length,
                itemBuilder: (context, index) {
                  return FriendsSelectedListViewHorzItem(
                      size: size,
                      userID: groupsMembersSelected
                          .getGroupsMemberSelectedFriendsList[index]);
                }),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
