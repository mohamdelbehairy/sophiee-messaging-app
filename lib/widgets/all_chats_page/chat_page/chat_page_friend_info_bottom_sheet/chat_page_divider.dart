import 'package:flutter/material.dart';

class ChatPageDivider extends StatelessWidget {
  const ChatPageDivider({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size.width * .08,
        child: Divider(
            thickness: size.width * .01, color: Colors.grey.withOpacity(.3)));
  }
}
