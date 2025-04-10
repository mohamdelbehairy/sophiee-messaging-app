import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophiee/main.dart';
import 'package:sophiee/pages/auth/provider_auth_page.dart';
import 'package:sophiee/pages/home_page.dart';
import 'package:sophiee/pages/on_boardring_page.dart';

import 'utils/methods/update_user_online.dart';

Future<void> runAppInit(
    {required GlobalKey<NavigatorState> navigatorKey}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('userID');
  final isFirstTimeUser = prefs.getString('isFirstTimeUser');
  if (token != null &&
      ((FirebaseAuth.instance.currentUser!.phoneNumber != null &&
              FirebaseAuth.instance.currentUser!.phoneNumber!.isNotEmpty) ||
          FirebaseAuth.instance.currentUser!.emailVerified)) {
    UpdateUserOnline.checkOnline();
    return runApp(
        SophieeApp(navigatorKey: navigatorKey, screen: const HomePage()));
  } else if (token == null && isFirstTimeUser != null) {
    return runApp(SophieeApp(
        navigatorKey: navigatorKey, screen: const ProviderAuthPage()));
  } else {
    return runApp(SophieeApp(
        navigatorKey: navigatorKey, screen: const OnBoardringPage()));
  }
}
