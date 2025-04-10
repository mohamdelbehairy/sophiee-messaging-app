import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/search_result_page.dart';
import 'package:sophiee/pages/story/story_view_page.dart';
import 'package:sophiee/utils/widget/flutter_toast_widget.dart';

import '../../../cubit/follow_status/follow_status_cubit.dart';
import '../../../cubit/notification/store_notification/store_notification_cubit.dart';
import '../../../cubit/story/story_cubit.dart';
import '../../../models/notification_model.dart';
import 'show_notification_list_tile_component.dart';

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
    var updateField = context.read<StoreNotificationCubit>();
    return GestureDetector(
      onTap: () async {
        await onTap(context);
        await updateField.updateNotificationField(
            userID: FirebaseAuth.instance.currentUser!.uid,
            notificationID: notificationModel.notificationID,
            fieldName: 'isRead',
            fieldValue: true);
      },
      child: ShowNotificationListTileComponent(
          isDark: isDark,
          size: size,
          friendData: friendData,
          notificationModel: notificationModel,
          diffrenceInDays: diffrenceInDays,
          diffrenceInHours: diffrenceInHours,
          diffrenceInMinutes: diffrenceInMinutes),
    );
  }

  Future<void> onTap(BuildContext context) async {
    if (friendData.userName == "Deleted Account") {
      FlutterToastWidget.showToast(msg: 'this account has been deleted');
    } else if (notificationModel.notificationType == 'follow') {
      context
          .read<FollowStatusCubit>()
          .checkFollowStatus(followerID: notificationModel.publishID);
      getnav.Get.to(() => SearchResultPage(userID: notificationModel.publishID),
          transition: getnav.Transition.rightToLeft);
    } else if (notificationModel.notificationType == 'live') {
      // if (notificationModel.isLive != null) {
      //   getnav.Get.to(() => LivePage(liveID: notificationModel.publishID),
      //       transition: getnav.Transition.rightToLeft);
      // } else {
      //   FlutterToastWidget.showToast(msg: 'live has been ended');
      // }
    } else {
      var isStory = context.read<StoryCubit>().checkIsStory(
          friendId: notificationModel.publishID, story: 'isStory');
      var story = context.read<StoryCubit>();
      if (await isStory) {
        story.getStory(friendId: notificationModel.publishID);
        await Future.delayed(const Duration(seconds: 1));
        getnav.Get.to(() => StoryViewPage(userID: notificationModel.publishID),
            transition: getnav.Transition.rightToLeft);
      } else {
        FlutterToastWidget.showToast(msg: 'story has been ended');
      }
    }
  }
}
