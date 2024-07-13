import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_members_page/groups_chat_add_members/groups_chat_add_member_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants.dart';
import '../../../../../../utils/widget/no_result_found.dart';

class GroupsAddMembersListView extends StatelessWidget {
  const GroupsAddMembersListView(
      {super.key,
      required this.size,
      required this.groupModel,
      required this.isDark});

  final Size size;
  final GroupModel groupModel;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetFriendsCubit, GetFriendsState>(
        builder: (context, state) {
          if (state is GetFriendsSuccess && state.friends.isNotEmpty) {
            return ListView.builder(
              itemCount: state.friends.length,
              itemBuilder: (context, index) {
                return GroupsChatAddMembersListTile(
                    size: size,
                    groupModel: groupModel,
                    user: state.friends[index],
                    isDark: isDark);
              },
            );
          } else {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomNoResultFound(
                    image: emptyImageUrl,
                    textOne: 'No Friend Found',
                    textTwo:
                        'We didn\'t find any friends yet \n Please add a new friend'),
              ],
            );
          }
        },
      ),
    );
  }
}
