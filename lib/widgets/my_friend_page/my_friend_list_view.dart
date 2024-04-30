import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFriendListView extends StatelessWidget {
  const MyFriendListView({super.key, required this.friend});
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
                  return Padding(
                    padding: EdgeInsets.only(left: size.width * .04),
                    child: CircleAvatar(
                      radius: size.width * .06,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          NetworkImage(state.friends[index].profileImage),
                    ),
                  );
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
