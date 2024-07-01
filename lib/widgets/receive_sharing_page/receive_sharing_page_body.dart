import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';
import '../../cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';
import '../../cubit/get_friends/get_friends_cubit.dart';
import '../../cubit/get_friends/get_friends_state.dart';
import '../../utils/widget/message_forward_app_bar.dart';
import '../all_chats_page/message_forward/message_forward_friend_list_tile.dart';

class ReceiveSharingPageBody extends StatelessWidget {
  const ReceiveSharingPageBody(
      {super.key,
      required this.size,
      required this.selectedFriend,
      required this.selectedGroup,
      required this.isDark});

  final Size size;
  final ForwardSelectedFriendCubit selectedFriend;
  final ForwardSelectedGroupCubit selectedGroup;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          messageForwardAppBar(size, selectedFriend, selectedGroup, context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text('All Friends',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: isDark ? Colors.white : Colors.black))),
          Expanded(child: BlocBuilder<GetFriendsCubit, GetFriendsState>(
            builder: (context, state) {
              if (state is GetFriendsSuccess) {
                return ListView.builder(
                    itemCount: state.friends.length,
                    itemBuilder: (context, index) {
                      return MessageForwardFriendsListTile(
                          user: state.friends[index]);
                    });
              } else {
                return Container();
              }
            },
          )),
        ],
      ),
    );
  }
}
