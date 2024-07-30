import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/notification_model.dart';

import '../../../cubit/auth/login/login_cubit.dart';
import '../../../utils/methods/default_user_model.dart';
import 'show_notification_list_tile_body.dart';

class ShowNotificationListTile extends StatelessWidget {
  const ShowNotificationListTile(
      {super.key,
      required this.notificationModel,
      required this.size,
      required this.diffrenceInMinutes,
      required this.diffrenceInHours,
      required this.diffrenceInDays});
  final NotificationModel notificationModel;
  final Size size;
  final int diffrenceInMinutes, diffrenceInHours, diffrenceInDays;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final friendData = state.userModel.firstWhere(
              (element) => element.userID == notificationModel.publishID,
              orElse: () => defaultUserModel(userID: notificationModel.notificationID));
          return ShowNotificationListTileBody(
              isDark: isDark,
              size: size,
              diffrenceInMinutes: diffrenceInMinutes,
              diffrenceInHours: diffrenceInHours,
              diffrenceInDays: diffrenceInDays,
              friendData: friendData,
              notificationModel: notificationModel);
        } else {
          return const SizedBox();
        }
      },
    );
  }

 
}
