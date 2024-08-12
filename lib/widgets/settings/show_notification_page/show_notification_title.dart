import 'package:flutter/material.dart';

import '../../../models/notification_model.dart';
import '../../../models/users_model.dart';

class ShowNotificationTitle extends StatelessWidget {
  const ShowNotificationTitle(
      {super.key,
      required this.notificationModel,
      required this.friendData,
      required this.isDark});

  final NotificationModel notificationModel;
  final UserModel friendData;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Text(
        notificationModel.notificationType == "live"
            ? '${friendData.userName.length <= 12 ? friendData.userName : friendData.userName.split(" ")[0]} is starting live now'
            : notificationModel.notificationType == "image"
                ? '${friendData.userName.length <= 12 ? friendData.userName : friendData.userName.split(" ")[0]} is adding an image'
                : notificationModel.notificationType == "video"
                    ? '${friendData.userName.length <= 12 ? friendData.userName : friendData.userName.split(" ")[0]} is adding a video'
                    : '${friendData.userName.length <= 12 ? friendData.userName : friendData.userName.split(" ")[0]} started following you',
        style: TextStyle(
            fontWeight: FontWeight.normal,
            color: notificationModel.isRead && isDark
                ? const Color(0xff757575)
                : notificationModel.isRead && !isDark
                    ? const Color(0xff969a9b)
                    : isDark
                        ? Colors.white
                        : Colors.black));
  }
}
