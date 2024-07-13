import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/models/users_model.dart';

import '../../../../../constants.dart';

class GroupsChatMembersStatus extends StatelessWidget {
  const GroupsChatMembersStatus(
      {super.key,
      required this.size,
      required this.color,
      required this.isDark,
      required this.membersData});
  final Size size;
  final Color color;
  final bool isDark;
  final UserModel membersData;

  @override
  Widget build(BuildContext context) {
    return membersData.userID != FirebaseAuth.instance.currentUser!.uid
        ? CircleAvatar(
            radius: size.width * .016,
            backgroundColor: isDark ? cardDarkModeBackground : Colors.white,
            child: CircleAvatar(
              radius: size.width * .011,
              backgroundColor: color,
            ),
          )
        : const SizedBox();
  }
}
