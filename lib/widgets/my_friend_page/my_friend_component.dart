import 'package:flutter/material.dart';

import '../../cubit/follower/follower_cubit.dart';
import '../../models/users_model.dart';
import 'my_friend_item_two_details.dart';

class MyFriendItemTwoComponent extends StatelessWidget {
  const MyFriendItemTwoComponent(
      {super.key,
      required this.widget,
      required this.user,
      required this.isDark,
      required this.size,
      required this.follower,
      required this.userData});

  final Widget? widget;
  final UserModel user;
  final bool isDark;
  final Size size;
  final FollowerCubit follower;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    return MyFriendItemTwoDetails(
        widget: widget, user: user, isDark: isDark, size: size);
  }
}
