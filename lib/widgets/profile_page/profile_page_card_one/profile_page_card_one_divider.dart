import 'package:flutter/material.dart';

class ProfilePageCardOneDivider extends StatelessWidget {
  const ProfilePageCardOneDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .04),
        child: Divider(thickness: 1, color: Colors.grey.withOpacity(.1)));
  }
}

