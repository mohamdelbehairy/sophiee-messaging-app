import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/all_chats_shimmer_status/all_chats_shimmer_status.dart';
import '../cubit/chats/chats_cubit.dart';
import '../cubit/get_followers/get_followers_cubit.dart';
import '../cubit/get_following/get_following_cubit.dart';
import '../cubit/get_friends/get_friends_cubit.dart';
import '../cubit/groups/create_groups/create_groups_cubit.dart';
import '../cubit/notification/follower_notification/follower_notification_cubit.dart';
import '../cubit/notification/group_notification/group_notification_cubit.dart';
import '../cubit/notification/live_notification/live_notification_cubit.dart';
import '../cubit/notification/message_notification/message_notification_cubit.dart';
import '../cubit/notification/notification_setting/notification_setting_cubit.dart';
import '../cubit/notification/story_notification/story_notification_cubit.dart';

abstract class ImortMethods {
  static void imortMethod(BuildContext context,AllChatsShimmerStatusCubit appStatusCubit) async {
    var initLocalNotification = context.read<NotificationSettingCubit>();

    initLocalNotification.initLocalNotification();
    context.read<FollowerNotificationCubit>().initFollowerNotification();
    context.read<MessageNotificationCubit>().initMessageNotification();
    context.read<StoryNotificationCubit>().initStoryNotification();
    context.read<GroupNotificationCubit>().initGroupMessageNotification();
    context.read<LiveNotificationCubit>().initLiveNotification();

    initLocalNotification.appState(context);

    context.read<ChatsCubit>().chats();
    context.read<CreateGroupsCubit>().getGroups();

    context
        .read<GetFriendsCubit>()
        .getFriends(userID: FirebaseAuth.instance.currentUser!.uid);
    context
        .read<GetFollowersCubit>()
        .getFollowers(userID: FirebaseAuth.instance.currentUser!.uid);
    context
        .read<GetFollowingCubit>()
        .getFollowing(userID: FirebaseAuth.instance.currentUser!.uid);
    await Future.delayed(const Duration(seconds: 5));
    appStatusCubit.setLoading(false);
  }
}
