import 'package:flutter/material.dart';
import 'package:sophiee/models/users_model.dart';

class CardOneSubTitle extends StatelessWidget {
  const CardOneSubTitle(
      {super.key,
      required this.user,
      required this.size,
      required this.isDark});

  final UserModel user;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Text(user.nickName,
        style: TextStyle(
            color: isDark ? Colors.white60 : Colors.grey,
            fontSize: size.width * .03));
  }
}
