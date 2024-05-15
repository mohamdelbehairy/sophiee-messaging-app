import 'package:flutter/material.dart';

class GroupsChatPageInfoAppBar extends StatelessWidget {
  const GroupsChatPageInfoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'About Group Chat',
      style: TextStyle(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
    );
  }
}
