import 'package:flutter/material.dart';

import '../../../../../models/users_model.dart';

class GroupChatMemberTitle extends StatelessWidget {
  const GroupChatMemberTitle(
      {super.key, required this.membersData, required this.isDark});

  final UserModel membersData;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: !membersData.isBioAndNickName ? 8 : 0.0),
        child: Text(membersData.userName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: isDark ? Colors.white : Colors.black)));
  }
}
