import 'package:flutter/material.dart';

class ContactName extends StatelessWidget {
  const ContactName(
      {super.key,
      required this.size,
      required this.phoneContactName,
      required this.isDark});

  final Size size;
  final String phoneContactName;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: size.width * .01),
        child: Text(phoneContactName,
            style: TextStyle(
                color: isDark ? Colors.white : const Color(0xff2b2c33),
                fontSize: size.width * .05,
                fontWeight: FontWeight.normal)));
  }
}
