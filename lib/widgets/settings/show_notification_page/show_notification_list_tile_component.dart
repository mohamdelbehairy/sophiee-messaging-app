import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/notification_model.dart';
import '../../../models/users_model.dart';
import 'show_notification_leading.dart';
import 'show_notification_sub_title.dart';
import 'show_notification_title.dart';

class ShowNotificationListTileComponent extends StatelessWidget {
  const ShowNotificationListTileComponent(
      {super.key,
      required this.isDark,
      required this.size,
      required this.friendData,
      required this.notificationModel,
      required this.diffrenceInDays,
      required this.diffrenceInHours,
      required this.diffrenceInMinutes});

  final bool isDark;
  final Size size;
  final UserModel friendData;
  final NotificationModel notificationModel;
  final int diffrenceInDays, diffrenceInHours, diffrenceInMinutes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isDark ? cardDarkModeBackground : const Color(0xfff3f7f8),
          borderRadius: BorderRadius.circular(12)),
      child: ListTile(
          leading: ShowNotificationLeading(
              size: size, isDark: isDark, friendData: friendData),
          title: ShowNotificationTitle(
              notificationModel: notificationModel,
              friendData: friendData,
              isDark: isDark),
          subtitle: ShowNotificationSubTitle(
              notificationModel: notificationModel,
              diffrenceInDays: diffrenceInDays,
              diffrenceInHours: diffrenceInHours,
              diffrenceInMinutes: diffrenceInMinutes,
              isDark: isDark)),
    );
  }
}
