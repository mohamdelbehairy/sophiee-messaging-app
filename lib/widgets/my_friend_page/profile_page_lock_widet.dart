import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/users_model.dart';

class ProfilePageLockWidget extends StatelessWidget {
  const ProfilePageLockWidget(
      {super.key,
      required this.size,
      required this.user,
      required this.isDark,
      required this.isFriend,
      required this.userData});

  final Size size;
  final UserModel user, userData;
  final bool isDark, isFriend;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(profileLockImageurl,
            fit: BoxFit.cover, height: size.height * .3),
        // if (isFriend)
        if (user.blockUsers.contains(userData.userID))
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
