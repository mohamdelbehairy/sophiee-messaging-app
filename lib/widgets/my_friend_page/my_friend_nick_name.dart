import 'package:flutter/material.dart';

import '../../models/users_model.dart';

class MyFriendNickName extends StatelessWidget {
  const MyFriendNickName({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Text(user.isBioAndNickName ? user.nickName : '',
        style: const TextStyle(color: Colors.blue));
  }
}