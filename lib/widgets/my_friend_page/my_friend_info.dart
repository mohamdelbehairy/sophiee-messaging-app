import 'package:flutter/material.dart';

import '../../models/users_model.dart';
import 'my_friend_nick_name.dart';
import 'my_friend_user_name.dart';
import 'user_name_circle.dart';

class MyFriendInfo extends StatelessWidget {
  const MyFriendInfo(
      {super.key,
      required this.user,
      required this.isDark,
      required this.size});

  final UserModel user;
  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            MyFriendUserName(user: user, isDark: isDark, size: size),
            const SizedBox(width: 4),
            const UserNameCircle()
          ],
        ),
        MyFriendNickName(user: user)
      ],
    );
  }
}
