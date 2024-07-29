import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/notification/get_notification/get_notification_cubit.dart';

import '../../../constants.dart';
import '../../../utils/widget/loading_animation_circle_indicator.dart';
import '../../../utils/widget/no_result_found.dart';
import 'show_motification_list_view.dart';

class ShowNotificationPageBody extends StatelessWidget {
  const ShowNotificationPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var getNotification = context.read<GetNotificationCubit>();
    var size = MediaQuery.sizeOf(context);
    return BlocBuilder<GetNotificationCubit, GetNotificationState>(
      builder: (context, state) {
        if (state is GetNotificationLoading) {
          return LoadingAnimationCircleIndicator(size: size);
        }
        if (getNotification.notification.isNotEmpty) {
          return ShowNotificationListView(
              getNotification: getNotification, size: size);
        } else {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomNoResultFound(
                  image: noNotificationImageUrl, textOne: '', textTwo: ''),
            ],
          );
        }
      },
    );
  }
}
