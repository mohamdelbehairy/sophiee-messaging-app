import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_friend_list_view_item.dart';

class MyFriendListViewFriends extends StatelessWidget {
  const MyFriendListViewFriends({super.key, required this.friend});
  final UserModel friend;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    context.read<GetFriendsCubit>().getFriends(userID: friend.userID);

    return SizedBox(
      height: size.height * .062,
      child: BlocBuilder<GetFriendsCubit, GetFriendsState>(
        builder: (context, state) {
          if (state is GetFriendsSuccess) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.friends.length,
                itemBuilder: (context, index) {
                  return MyFriendListViewItem(
                      size: size, user: state.friends[index]);
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
