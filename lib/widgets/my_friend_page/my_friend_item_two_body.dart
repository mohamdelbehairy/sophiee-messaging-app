import 'package:flutter/material.dart';

import '../../cubit/follower/follower_cubit.dart';
import '../../cubit/friends/friends_cubit.dart';
import '../../models/users_model.dart';
import 'my_friend_component.dart';

class MyFriendItemTwoBody extends StatelessWidget {
  const MyFriendItemTwoBody(
      {super.key,
      required this.follower,
      required this.user,
      required this.friend,
      required this.userData,
      required this.isDark,
      required this.size,
      required this.infoCalls,
      this.followButton});

  final FollowerCubit follower;
  final FriendsCubit friend;
  final UserModel userData, user;
  final bool isDark;
  final Size size;
  final Widget? infoCalls, followButton;

  @override
  Widget build(BuildContext context) {
    return MyFriendItemTwoComponent(
        infoCalls: infoCalls,
        followButton: followButton,
        user: user,
        isDark: isDark,
        size: size,
        follower: follower,
        userData: userData);
  }
}
