import 'package:flutter/material.dart';

class GroupsChatPageNotSendMessage extends StatelessWidget {
  const GroupsChatPageNotSendMessage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .06,
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: size.width * .03),
      decoration: BoxDecoration(
          color: const Color(0xff2b2c33).withOpacity(.1),
          borderRadius: BorderRadius.circular(size.width * .04)),
      child: const Center(
          child: Text('Sending messages is not allowed in this group.',
              style: TextStyle(color: Color(0xff878787)))),
    );
  }
}
