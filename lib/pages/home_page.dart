import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/all_chats_shimmer_status/all_chats_shimmer_status.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/chats/chats_cubit.dart';
import 'package:sophiee/cubit/connectivity/connectivity_cubit.dart';
import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/pages/chats/all_chats_page.dart';
import 'package:sophiee/pages/profile_page.dart';
import 'package:sophiee/pages/settings_page.dart';
import 'package:sophiee/utils/shimmer/home/bottom_navigation_shimmer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

    context.read<ChatsCubit>().chats();
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
    var isDark = context.read<LoginCubit>().isDark;
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return BlocBuilder<AllChatsShimmerStatusCubit, bool>(
            builder: (context, isLoading) {
              return BlocBuilder<ConnectivityCubit, ConnectivityResult>(
                builder: (context, internet) {
                  if (internet == ConnectivityResult.wifi ||
                      internet == ConnectivityResult.mobile) {
                    return isLoading
                        ? BottomNavigationShimmer(isDark: isDark)
                        : NavigationBar(
                            backgroundColor:
                                isDark ? const Color(0xff2b2c33) : Colors.white10,
                            onDestinationSelected: (selectedIndex) {
                              setState(() {
                                index = selectedIndex;
                              });
                            },
                            indicatorColor: Colors.transparent,
                            selectedIndex: index,
                            destinations: const [
                              NavigationDestination(
                                  selectedIcon:
                                      Icon(Icons.person, color: kPrimaryColor),
                                  icon: Icon(Icons.person_outline_outlined),
                                  label: ''),
                              NavigationDestination(
                                  selectedIcon: Icon(
                                      FontAwesomeIcons.solidComment,
                                      color: kPrimaryColor),
                                  icon: Icon(FontAwesomeIcons.comment),
                                  label: ''),
                              NavigationDestination(
                                  selectedIcon: Icon(FontAwesomeIcons.gear,
                                      color: kPrimaryColor),
                                  icon: Icon(Icons.settings_outlined),
                                  label: ''),
                            ],
                          );
                  } else {
                    return BottomNavigationShimmer(isDark: isDark);
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
