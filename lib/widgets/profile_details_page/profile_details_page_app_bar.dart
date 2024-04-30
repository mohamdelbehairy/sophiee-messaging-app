import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';

class ProfileDetailsPageAppBar extends StatelessWidget {
  const ProfileDetailsPageAppBar(
      {super.key, required this.user, required this.size});

  final UserModel user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Text(user.userName,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontSize: size.width * .05));
  }
}
