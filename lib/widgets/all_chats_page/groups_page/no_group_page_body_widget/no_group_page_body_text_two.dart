import 'package:flutter/material.dart';

class NoGroupPageBodyTextTwo extends StatelessWidget {
  const NoGroupPageBodyTextTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
        'You didn\'t made any conversation yet.\n please create a group chat',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.grey.shade400, fontWeight: FontWeight.w400));
  }
}