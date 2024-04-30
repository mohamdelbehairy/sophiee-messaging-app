import 'package:flutter/material.dart';

class CustomPhoneNumberText extends StatelessWidget {
  const CustomPhoneNumberText(
      {super.key,
      required this.firsttext,
      required this.firsttextSize,
      required this.size,
      required this.secondtext});

  final String firsttext;
  final String secondtext;
  final double firsttextSize;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(firsttext, style: TextStyle(fontSize: firsttextSize)),
      SizedBox(height: size.width * .02),
      Text(secondtext,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white54, fontSize: size.height * .014))
    ]);
  }
}
