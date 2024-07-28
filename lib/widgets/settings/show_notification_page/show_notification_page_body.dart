import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/notification/get_notification/get_notification_cubit.dart';

import 'show_notification_list_tile.dart';

class ShowNotificationPageBody extends StatelessWidget {
  const ShowNotificationPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var getNotification = context.read<GetNotificationCubit>();
    var size = MediaQuery.sizeOf(context);
    return BlocBuilder<GetNotificationCubit, GetNotificationState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: getNotification.notification.length,
            itemBuilder: (context, index) {
              int diffrenceInMinutes = Timestamp.now()
                  .toDate()
                  .difference(getNotification.notification[index].dateTime)
                  .inMinutes;
              int diffrenceInHours = Timestamp.now()
                  .toDate()
                  .difference(getNotification.notification[index].dateTime)
                  .inHours;
              int diffrenceInDays = Timestamp.now()
                  .toDate()
                  .difference(getNotification.notification[index].dateTime)
                  .inDays;
              return Padding(
                  padding: EdgeInsets.only(
                      top: index == 0 ? 24 : 0.0,
                      bottom: 10,
                      right: 12,
                      left: 12),
                  child: ShowNotificationListTile(
                      size: size,
                      diffrenceInMinutes: diffrenceInMinutes,
                      diffrenceInHours: diffrenceInHours,
                      diffrenceInDays: diffrenceInDays,
                      notificationModel: getNotification.notification[index]));
            });
      },
    );
  }
}
