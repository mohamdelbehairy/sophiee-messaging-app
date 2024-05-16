import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class GroupsChatMembersStatus extends StatelessWidget {
  const GroupsChatMembersStatus(
      {super.key, required this.size, required this.color, required this.isDark});
  final Size size;
  final Color color;
final bool isDark;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size.width * .016,
      backgroundColor: isDark ? cardDarkModeBackground : Colors.white,
      child: CircleAvatar(
        radius:size.width * .011,
        backgroundColor: color,
      ),
    );
  }
}
