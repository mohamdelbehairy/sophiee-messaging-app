import 'package:flutter/material.dart';

class GroupsChatMembersStatus extends StatelessWidget {
  const GroupsChatMembersStatus(
      {super.key, required this.size, required this.color});
  final Size size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size.height * .008,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: size.height * .006,
        backgroundColor: color,
      ),
    );
  }
}
