import 'package:flutter/material.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/my_friend_page/my_friend_button_body.dart';

import 'my_friend_info.dart';

class MyFriendItemTwoDetails extends StatelessWidget {
  const MyFriendItemTwoDetails(
      {super.key,
      required this.user,
      required this.isDark,
      required this.size,
      required this.isFollowing,
      required this.onTap,
      required this.widget});

  final UserModel user;
  final bool isDark, isFollowing;
  final Size size;
  final Function() onTap;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyFriendInfo(user: user, isDark: isDark, size: size),
          widget!,
          InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: onTap,
              child: MyFriendButtonBody(size: size, isFollowing: isFollowing))
        ],
      ),
    );
  }
}
