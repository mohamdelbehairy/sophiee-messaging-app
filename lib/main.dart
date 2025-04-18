import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/firebase_options.dart';
import 'package:sophiee/run_app_init.dart';
import 'package:sophiee/simple_observe_bloc.dart';
import 'package:sophiee/utils/cached_images.dart';

import 'utils/methods/system_chrome_method.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  systemChromeMethod();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await CachedImages.loadImages(navigatorKey.currentContext!);
  });
  await runAppInit(navigatorKey: navigatorKey);
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
