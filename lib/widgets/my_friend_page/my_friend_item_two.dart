import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/follower/follower_cubit.dart';
import 'package:sophiee/cubit/friends/friends_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_friend_item_two_body.dart';

class MyFriendItemTwo extends StatelessWidget {
  const MyFriendItemTwo(
      {super.key,
      required this.user,
      this.infoCalls,
      this.followButton,
      required this.userData});
  final UserModel user, userData;
  final Widget? infoCalls, followButton;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final follower = context.read<FollowerCubit>();
    final friend = context.read<FriendsCubit>();
    final isDark = context.read<LoginCubit>().isDark;

    return MyFriendItemTwoBody(
        followButton: followButton,
        infoCalls: infoCalls,
        follower: follower,
        user: user,
        friend: friend,
        userData: userData,
        isDark: isDark,
        size: size);
  }
}
