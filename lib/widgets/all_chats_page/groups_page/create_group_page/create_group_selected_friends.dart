import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_page_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupSelectedFriends extends StatelessWidget {
  const CreateGroupSelectedFriends({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var isDark = context.read<LoginCubit>().isDark;
    var selectedFriends = context.read<GroupsMemberSelectedCubit>();
    return BlocBuilder<GetFriendsCubit, GetFriendsState>(
      builder: (context, state) {
        if (state is GetFriendsSuccess) {
          return Expanded(
            child: ListView.builder(
                itemCount: state.friends.length,
                itemBuilder: (context, index) {
                  selectedFriends.getGroupsMemberSelectedFriends();
                  return CreateGroupListTile(
                      isDark: isDark, user: state.friends[index], size: size);
                }),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
