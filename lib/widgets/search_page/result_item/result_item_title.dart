import 'package:flutter/material.dart';

import '../../../models/users_model.dart';
import 'result_item_nick_name.dart';
import 'result_item_user_name.dart';

class ResultItemTitle extends StatelessWidget {
  const ResultItemTitle(
      {super.key,
      required this.size,
      required this.user,
      required this.isDark,
      required this.userData});

  final Size size;
  final UserModel user, userData;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ResultItemUserName(size: size, user: user, isDark: isDark),
        if (!userData.blockUsers.contains(user.userID) &&
            !user.blockUsers.contains(userData.userID))
          ResultItemNickName(user: user, isDark: isDark, size: size),
      ],
    );
  }
}
