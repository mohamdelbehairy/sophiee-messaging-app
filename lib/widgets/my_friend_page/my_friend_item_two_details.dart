import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/models/users_model.dart';

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
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {},
                    child:
                        const Icon(Icons.call, size: 30, color: Colors.blue)),
                const SizedBox(width: 30),
                GestureDetector(
                    onTap: () {},
                    child: const Icon(FontAwesomeIcons.video,
                        size: 30, color: kPrimaryColor)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
