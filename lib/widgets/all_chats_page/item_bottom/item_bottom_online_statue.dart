import 'package:flutter/material.dart';

import '../../../constants.dart';


class ItemBottomOnlineStatue extends StatelessWidget {
  const ItemBottomOnlineStatue(
      {super.key,
      required this.size,
      required this.isDark,
      required this.color});

  final Size size;
  final bool isDark;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      right: 0.0,
      child: CircleAvatar(
          radius: size.width * .02,
          backgroundColor:
              isDark ? cardDarkModeBackground : const Color(0xfff1f2f2),
          child:
              CircleAvatar(backgroundColor: color, radius: size.width * .015)),
    );
  }
}
