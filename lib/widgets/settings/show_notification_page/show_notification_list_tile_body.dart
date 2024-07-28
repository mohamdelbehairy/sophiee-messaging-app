import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/search_result_page.dart';
import 'package:sophiee/utils/widget/flutter_toast_widget.dart';

import '../../../constants.dart';
import '../../../models/notification_model.dart';
import 'show_notification_leading.dart';
import 'show_notification_sub_title.dart';
import 'show_notification_title.dart';

class ShowNotificationListTileBody extends StatelessWidget {
  const ShowNotificationListTileBody(
      {super.key,
      required this.isDark,
      required this.friendData,
      required this.notificationModel,
      required this.size,
      required this.diffrenceInMinutes,
      required this.diffrenceInHours,
      required this.diffrenceInDays});
  final UserModel friendData;
  final bool isDark;
  final NotificationModel notificationModel;
  final Size size;
  final int diffrenceInMinutes, diffrenceInHours, diffrenceInDays;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (notificationModel.notificationType == 'follow') {
          getnav.Get.to(
              () => SearchResultPage(userID: notificationModel.publishID),
              transition: getnav.Transition.rightToLeft);
        } else if (notificationModel.notificationType == 'live') {
          if (notificationModel.isLive != null) {
            getnav.Get.to(
                () => SearchResultPage(userID: notificationModel.publishID),
                transition: getnav.Transition.rightToLeft);
          } else {
            FlutterToastWidget.showToast(msg: 'live has been ended');
          }
        } else {
          log(notificationModel.notificationType);
        }
      },
      child: Container(
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
                diffrenceInDays: diffrenceInDays,
                diffrenceInHours: diffrenceInHours,
                diffrenceInMinutes: diffrenceInMinutes,
                isDark: isDark)),
      ),
    );
  }
}
