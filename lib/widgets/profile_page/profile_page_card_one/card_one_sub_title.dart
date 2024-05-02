import 'package:flutter/material.dart';
import 'package:sophiee/models/users_model.dart';

class CardOneSubTitle extends StatelessWidget {
  const CardOneSubTitle({super.key, required this.user, required this.size});

  final UserModel user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Text(user.nickName,
        style: TextStyle(color: Colors.grey, fontSize: size.width * .03));
  }
}