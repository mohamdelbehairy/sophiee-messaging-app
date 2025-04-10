import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';

class VerificationPageCustomTopIcon extends StatelessWidget {
  const VerificationPageCustomTopIcon({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: size.height * .04,
        backgroundColor: kPrimaryColor.withValues(alpha: .07),
        child: CircleAvatar(
            radius: size.height * .03,
            backgroundColor: kPrimaryColor.withValues(alpha: .1),
            child: Icon(Icons.email,
                color: kPrimaryColor, size: size.height * .03)));
  }
}
