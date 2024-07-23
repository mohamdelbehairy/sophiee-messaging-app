import 'package:flutter/material.dart';

class MyStoryPageTitle extends StatelessWidget {
  const MyStoryPageTitle(
      {super.key,
      required this.size,
      required this.isDark,
      required this.differenceInMinutes,
      required this.differenceInHours});
  final Size size;
  final bool isDark;
  final int differenceInMinutes, differenceInHours;

  @override
  Widget build(BuildContext context) {
    return Text(
        differenceInMinutes < 1
            ? 'Just now'
            : differenceInHours < 1
                ? '$differenceInMinutes minutes ago'
                : '$differenceInHours hours ago',
        style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.normal));
  }
}
