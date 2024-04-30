import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupAppBar extends StatelessWidget {
  const CreateGroupAppBar({
    super.key,
    required this.size,
    required this.groupsMember,
  });

  final Size size;
  final GroupsMemberSelectedCubit groupsMember;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('New group', style: TextStyle(fontWeight: FontWeight.normal)),
        BlocBuilder<GroupsMemberSelectedCubit, GroupsMemberSelectedState>(
          builder: (context, state) {
            return BlocBuilder<GetFriendsCubit, GetFriendsState>(
              builder: (context, friendsState) {
                if (friendsState is GetFriendsSuccess) {
                  return Text(
                      groupsMember.getGroupsMemberSelectedFriendsList.isEmpty
                          ? 'Add friends'
                          : '${groupsMember.getGroupsMemberSelectedFriendsList.length} of ${friendsState.friends.length} selected',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: size.width * .03));
                } else {
                  return Container();
                }
              },
            );
          },
        ),
      ],
    );
  }
}
