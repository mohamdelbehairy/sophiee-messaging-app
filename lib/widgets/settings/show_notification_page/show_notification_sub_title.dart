import 'package:flutter/material.dart';
import 'package:sophiee/models/notification_model.dart';

class ShowNotificationSubTitle extends StatelessWidget {
  const ShowNotificationSubTitle(
      {super.key,
      required this.diffrenceInDays,
      required this.diffrenceInHours,
      required this.diffrenceInMinutes,
      required this.isDark,
      required this.notificationModel});

  final int diffrenceInDays;
  final int diffrenceInHours;
  final int diffrenceInMinutes;
  final bool isDark;
  final NotificationModel notificationModel;

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
          color: notificationModel.isRead && isDark
              ? const Color(0xff757575)
              : notificationModel.isRead && !isDark
                  ? const Color(0xff969a9b)
                  : isDark
                      ? const Color(0xff797979)
                      : const Color(0xffa2a6a7),
          fontWeight: FontWeight.normal),
    );
  }
}
