import 'package:flutter/material.dart';

import '../../models/users_model.dart';

class ProfileDetailsListTileTitle extends StatelessWidget {
  const ProfileDetailsListTileTitle(
      {super.key,
      required this.data,
      required this.size,
      required this.isDark});

  final UserModel data;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: data.bio.isEmpty && data.nickName.isEmpty
                ? size.width * .02
                : 0),
        child: Text(data.userName,
            style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontSize: size.width * .038)));
  }
}
