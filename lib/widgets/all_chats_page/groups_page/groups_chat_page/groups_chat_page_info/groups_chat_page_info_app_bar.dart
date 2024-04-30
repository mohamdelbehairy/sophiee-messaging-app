import 'package:flutter/material.dart';

class GroupsChatPageInfoAppBar extends StatelessWidget {
  const GroupsChatPageInfoAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      'About Group Chat',
      style: TextStyle(
          color: Colors.white70,
          fontSize: size.height * .025,
          fontWeight: FontWeight.normal),
    );
  }
}
