import 'package:flutter/material.dart';
import 'package:sophiee/models/users_model.dart';

import 'my_friend_info.dart';

class MyFriendItemTwoDetails extends StatelessWidget {
  const MyFriendItemTwoDetails(
      {super.key,
      required this.user,
      required this.isDark,
      required this.size,
      required this.infoCalls,
      this.followButton});

  final UserModel user;
  final bool isDark;
  final Size size;
  final Widget? infoCalls, followButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyFriendInfo(user: user, isDark: isDark, size: size),
          if (user.isAudioAndVideoCall && infoCalls != null) infoCalls!,
          if(followButton != null)
          followButton!,
        ],
      ),
    );
  }
}
