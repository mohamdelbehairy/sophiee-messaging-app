import 'package:flutter/material.dart';

class ContactNumber extends StatelessWidget {
  const ContactNumber(
      {super.key, required this.formattedPhoneNumber, required this.isDark});

  final String formattedPhoneNumber;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Text(formattedPhoneNumber,
        style: TextStyle(
            color: isDark
                ? Colors.grey
                : const Color(0xff2b2c33).withOpacity(.3)));
  }
}
