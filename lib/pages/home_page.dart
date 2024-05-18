import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/all_chats_shimmer_status/all_chats_shimmer_status.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/chats/chats_cubit.dart';
import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/notification/follower_notification/follower_notification_cubit.dart';
import 'package:sophiee/cubit/notification/message_notification/message_notification_cubit.dart';
import 'package:sophiee/cubit/notification/notification_setting/notification_setting_cubit.dart';
import 'package:sophiee/cubit/notification/story_notification/story_notification_cubit.dart';
import 'package:sophiee/pages/chats/all_chats_page.dart';
import 'package:sophiee/pages/profile_page.dart';
import 'package:sophiee/pages/setting/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubit/groups/create_groups/create_groups_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AllChatsShimmerStatusCubit appStatusCubit;

  int index = 0;
  final screens = const [
    ProfilePage(),
    AllChatsPage(),
    SettingsPage(),
  ];
  @override
  void initState() {
    super.initState();
    var initLocalNotification = context.read<NotificationSettingCubit>();

    initLocalNotification.initLocalNotification();
    context.read<FollowerNotificationCubit>().initFollowerNotification();
    context.read<MessageNotificationCubit>().initMessageNotification();
    context.read<StoryNotificationCubit>().initStoryNotification();
    
    initLocalNotification.appState(context);

    context.read<ChatsCubit>().chats();
    context.read<CreateGroupsCubit>().getGroups();

    appStatusCubit = context.read<AllChatsShimmerStatusCubit>();
    context
        .read<GetFriendsCubit>()
        .getFriends(userID: FirebaseAuth.instance.currentUser!.uid);
    context
        .read<GetFollowersCubit>()
        .getFollowers(userID: FirebaseAuth.instance.currentUser!.uid);
    context
        .read<GetFollowingCubit>()
        .getFollowing(userID: FirebaseAuth.instance.currentUser!.uid);
    _getLoading();
  }

  _getLoading() async {
    await Future.delayed(const Duration(seconds: 5));
    appStatusCubit.setLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return NavigationBar(
            backgroundColor: context.read<LoginCubit>().isDark
                ? kDarkModeBackgroundColor
                : Colors.white10,
            onDestinationSelected: (selectedIndex) {
              setState(() {
                index = selectedIndex;
              });
            },
            indicatorColor: Colors.transparent,
            selectedIndex: index,
            destinations: const [
              NavigationDestination(
                  selectedIcon: Icon(Icons.person, color: kPrimaryColor),
                  icon: Icon(Icons.person_outline_outlined),
                  label: ''),
              NavigationDestination(
                  selectedIcon:
                      Icon(FontAwesomeIcons.solidComment, color: kPrimaryColor),
                  icon: Icon(FontAwesomeIcons.comment),
                  label: ''),
              NavigationDestination(
                  selectedIcon:
                      Icon(FontAwesomeIcons.gear, color: kPrimaryColor),
                  icon: Icon(Icons.settings_outlined),
                  label: ''),
            ],
          );
        },
      ),
    );
  }
}
