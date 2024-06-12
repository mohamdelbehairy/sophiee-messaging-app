import 'package:flutter/material.dart';

import '../../../models/users_model.dart';
import 'result_item_nick_name.dart';
import 'result_item_user_name.dart';

class ResultItemTitle extends StatelessWidget {
  const ResultItemTitle(
      {super.key,
      required this.size,
      required this.user,
      required this.isDark});

  final Size size;
  final UserModel user;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ResultItemUserName(size: size, user: user, isDark: isDark),
        ResultItemNickName(user: user, isDark: isDark, size: size),
      ],
    );
  }
}