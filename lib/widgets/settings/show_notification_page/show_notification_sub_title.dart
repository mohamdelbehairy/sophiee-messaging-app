import 'package:flutter/material.dart';

class ShowNotificationSubTitle extends StatelessWidget {
  const ShowNotificationSubTitle(
      {super.key,
      required this.diffrenceInDays,
      required this.diffrenceInHours,
      required this.diffrenceInMinutes,
      required this.isDark});

  final int diffrenceInDays;
  final int diffrenceInHours;
  final int diffrenceInMinutes;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Text(
      diffrenceInDays > 0
          ? '$diffrenceInDays days ago'
          : diffrenceInHours > 0
              ? '$diffrenceInHours hours ago'
              : diffrenceInMinutes > 0
                  ? '$diffrenceInMinutes minutes ago'
                  : 'now',
      style: TextStyle(
          color: isDark ? const Color(0xff797979) : const Color(0xffa2a6a7),
          fontWeight: FontWeight.normal),
    );
  }
}
