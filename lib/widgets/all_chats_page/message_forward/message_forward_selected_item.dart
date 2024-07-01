import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';

class MessageForwardSelectedItem extends StatelessWidget {
  const MessageForwardSelectedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
        child: const Icon(Icons.done, size: 16, color: Colors.white));
  }
}
