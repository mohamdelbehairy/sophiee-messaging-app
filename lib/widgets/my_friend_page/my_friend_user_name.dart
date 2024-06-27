import 'package:flutter/material.dart';
import 'package:sophiee/models/users_model.dart';

class MyFriendUserName extends StatelessWidget {
  const MyFriendUserName(
      {super.key,
      required this.user,
      required this.isDark,
      required this.size});

  final UserModel user;
  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Text(user.userName,
        style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: size.width * .042));
  }
}
