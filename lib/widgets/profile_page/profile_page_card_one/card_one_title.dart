import 'package:flutter/material.dart';
import 'package:sophiee/models/users_model.dart';

class CardOneTitle extends StatelessWidget {
  const CardOneTitle({super.key, required this.user, required this.size, required this.isDark});

  final UserModel user;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Text(user.userName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: size.width * .043,
            fontWeight: FontWeight.normal,
            color: isDark ? Colors.white : Colors.black));
  }
}
