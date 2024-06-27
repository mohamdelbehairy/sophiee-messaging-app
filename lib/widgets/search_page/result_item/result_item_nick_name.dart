import 'package:flutter/material.dart';

import '../../../models/users_model.dart';

class ResultItemNickName extends StatelessWidget {
  const ResultItemNickName(
      {super.key,
      required this.user,
      required this.isDark,
      required this.size});

  final UserModel user;
  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(!user.isBioAndNickName ? '' : user.nickName,
            style: TextStyle(
                color: isDark ? Colors.white60 : Colors.grey,
                fontSize: size.width * .032),
            maxLines: 1,
            overflow: TextOverflow.ellipsis));
  }
}
