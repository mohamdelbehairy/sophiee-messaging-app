import 'package:flutter/material.dart';

import '../../models/users_model.dart';

class ProfileDetailsListTileTitle extends StatelessWidget {
  const ProfileDetailsListTileTitle(
      {super.key,
      required this.friendData,
      required this.size,
      required this.isDark});

  final UserModel friendData;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: friendData.bio.isEmpty && friendData.nickName.isEmpty  || !friendData.isBioAndNickName
                ? size.width * .02
                : 0),
        child: Text(friendData.userName,
            style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontSize: size.width * .038)));
  }
}
