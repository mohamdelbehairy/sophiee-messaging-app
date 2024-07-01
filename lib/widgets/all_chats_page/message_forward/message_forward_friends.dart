import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/widgets/all_chats_page/message_forward/message_forward_friend_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageForwardFriends extends StatelessWidget {
  const MessageForwardFriends(
      {super.key,
      required this.size,
      required this.isDark});
  final Size size;
  final bool isDark;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFriendsCubit, GetFriendsState>(
      builder: (context, state) {
        if (state is GetFriendsSuccess) {
          return SizedBox(
            height: size.height,
            child: ListView.builder(
                itemCount: state.friends.length,
                itemBuilder: (context, index) {
                  return MessageForwardFriendsListTile(
                      user: state.friends[index]);
                }),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
