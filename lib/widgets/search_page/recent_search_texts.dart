import 'package:flutter/material.dart';

import '../../models/users_model.dart';

class RecentSearchTexts extends StatelessWidget {
  const RecentSearchTexts(
      {super.key,
      required this.data,
      required this.isDark,
      required this.userData});

  final UserModel data, userData;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(data.userName,
            style: TextStyle(
                fontSize: 16, color: isDark ? Colors.white : Colors.black87)),
        const SizedBox(width: 8),
        if (data.isBioAndNickName &&
            !userData.blockUsers.contains(data.userID) &&
            !data.blockUsers.contains(userData.userID))
          Text(data.nickName,
              style: TextStyle(
                  fontSize: 12, color: isDark ? Colors.white60 : Colors.grey)),
      ],
    );
  }
}
