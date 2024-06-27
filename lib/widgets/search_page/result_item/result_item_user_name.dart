import 'package:flutter/material.dart';

import '../../../models/users_model.dart';

class ResultItemUserName extends StatelessWidget {
  const ResultItemUserName(
      {super.key,
      required this.size,
      required this.user,
      required this.isDark});

  final Size size;
  final UserModel user;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: size.width * .03),
        child: Text(user.userName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: isDark ? Colors.white : Colors.black)));
  }
}