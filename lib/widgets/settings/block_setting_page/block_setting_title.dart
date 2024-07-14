import 'package:flutter/material.dart';

import '../../../models/users_model.dart';

class BlockSettingTitle extends StatelessWidget {
  const BlockSettingTitle(
      {super.key, required this.userData, required this.isDark});

  final UserModel userData;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Text(userData.userName,
        style: TextStyle(color: isDark ? Colors.white : Colors.black));
  }
}
