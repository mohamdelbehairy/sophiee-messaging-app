import 'package:flutter/material.dart';
import 'package:sophiee/models/users_model.dart';

class CardOneTitle extends StatelessWidget {
  const CardOneTitle({super.key, required this.user, required this.size});

  final UserModel user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Text(user.userName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: size.width * .043, fontWeight: FontWeight.normal));
  }
}
