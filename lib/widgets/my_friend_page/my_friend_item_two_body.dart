import 'package:flutter/material.dart';
import 'package:sophiee/widgets/my_friend_page/my_friend_button_body.dart';

import 'my_friend_info.dart';
import 'my_friend_item_two.dart';

class MyFriendItemTwoBody extends StatelessWidget {
  const MyFriendItemTwoBody(
      {super.key,
      required this.widget,
      required this.isDark,
      required this.size,
      required this.isFollowing,
      required this.onTap});

  final MyFriendItemTwo widget;
  final bool isDark, isFollowing;
  final Size size;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyFriendInfo(user: widget.user, isDark: isDark, size: size),
          widget.widget!,
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
