import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPageFriendInfoBottom extends StatelessWidget {
  const ChatPageFriendInfoBottom({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    context
        .read<GetFriendsCubit>()
        .getFriends(userID: FirebaseAuth.instance.currentUser!.uid);
    return BlocBuilder<GetFriendsCubit, GetFriendsState>(
      builder: (context, state) {
        if (state is GetFriendsSuccess) {
          if (state.friends.any((friend) => friend.userID == user.userID)) {
            return Container(
              height: size.height * .045,
              width: size.width * .2,
              margin: EdgeInsets.only(right: size.width * .04),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.height * .04),
                  color: kPrimaryColor,
                  border: Border.all(color: Colors.transparent)),
              child: const Center(
                child: Text(
                  'Friends',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }
}
