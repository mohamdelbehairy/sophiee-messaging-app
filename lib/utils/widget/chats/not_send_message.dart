import 'package:flutter/material.dart';

class NotSendMessage extends StatelessWidget {
  const NotSendMessage({super.key, required this.size, required this.text});

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .06,
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: size.width * .03),
      decoration: BoxDecoration(
          color: const Color(0xff2b2c33).withValues(alpha:  .1),
          borderRadius: BorderRadius.circular(size.width * .04)),
      child:
          Center(child: Text(text, style: const TextStyle(color: Color(0xff878787)))),
    );
  }
}
