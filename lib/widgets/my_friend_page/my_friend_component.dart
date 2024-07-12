import 'package:flutter/material.dart';

import '../../cubit/follower/follower_cubit.dart';
import '../../models/users_model.dart';
import 'my_friend_item_two_details.dart';

class MyFriendItemTwoComponent extends StatelessWidget {
  const MyFriendItemTwoComponent(
      {super.key,
      required this.infoCalls,
      required this.user,
      required this.isDark,
      required this.size,
      required this.follower,
      required this.userData,
      this.followButton});

  final Widget? infoCalls, followButton;
  final UserModel user;
  final bool isDark;
  final Size size;
  final FollowerCubit follower;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    return MyFriendItemTwoDetails(
        infoCalls: infoCalls,
        followButton: followButton,
        user: user,
        userData: userData,
        isDark: isDark,
        size: size);
  }
}
