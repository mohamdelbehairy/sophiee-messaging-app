import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';

import '../../cubit/follower/follower_cubit.dart';
import '../../cubit/friends/friends_cubit.dart';
import '../../models/users_model.dart';
import 'icon_elispes_body.dart';

class MyFriendPageIconElispes extends StatelessWidget {
  const MyFriendPageIconElispes(
      {super.key,
      required this.user,
      required this.size,
      required this.isFriend});

  final UserModel user;
  final Size size;
  final bool isFriend;

  @override
  Widget build(BuildContext context) {
    final follower = context.read<FollowerCubit>();
    final friend = context.read<FriendsCubit>();
    return Positioned(
        right: 8,
        top: 40,
        child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
          builder: (context, userState) {
            if (userState is GetUserDataSuccess &&
                userState.userModel.isNotEmpty) {
              final userData = userState.userModel.firstWhere((element) =>
                  element.userID == FirebaseAuth.instance.currentUser!.uid);
              return IconElispesBody(
                  isFriend: isFriend,
                  follower: follower,
                  user: user,
                  friend: friend,
                  userData: userData,
                  size: size);
            } else {
              return Container();
            }
          },
        ));
  }
}
