import 'package:flutter/material.dart';

import '../../constants.dart';

class UserNameCircle extends StatelessWidget {
  const UserNameCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 9,
        width: 10,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor));
  }
}
