import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/users_model.dart';

class ProfilePageLockWidget extends StatelessWidget {
  const ProfilePageLockWidget(
      {super.key,
      required this.size,
      required this.user,
      required this.isDark});

  final Size size;
  final UserModel user;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(profileLockImageurl,
            fit: BoxFit.cover, height: size.height * .3),
        Text('${user.userName.split(' ')[0]} is locked your profile',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isDark ? Colors.white : Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w400)),
      ],
    );
  }
}
