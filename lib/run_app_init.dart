import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophiee/main.dart';
import 'package:sophiee/pages/auth/provider_auth_page.dart';
import 'package:sophiee/pages/home_page.dart';
import 'package:sophiee/pages/on_boardring_page.dart';

Future<void> runAppInit() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('userID');
  final isFirstTimeUser = prefs.getString('isFirstTimeUser');
  if (token != null &&
      ((FirebaseAuth.instance.currentUser!.phoneNumber != null &&
              FirebaseAuth.instance.currentUser!.phoneNumber!.isNotEmpty) ||
          FirebaseAuth.instance.currentUser!.emailVerified)) {
    // UpdateUserOnline.checkOnline();
    return runApp(const SophieeApp(screen: HomePage()));
  } else if (token == null && isFirstTimeUser != null) {
    return runApp(const SophieeApp(screen: ProviderAuthPage()));
  } else {
    return runApp(const SophieeApp(screen: OnBoardringPage()));
  }
}
