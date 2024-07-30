import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/custom_material_app.dart';
import 'package:sophiee/firebase_options.dart';
import 'package:sophiee/run_app_init.dart';
import 'package:sophiee/simple_observe_bloc.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import 'utils/methods/system_chrome_method.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  Bloc.observer = SimpleBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  ZegoUIKit().initLog().then((value) async {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );
    await runAppInit(navigatorKey: navigatorKey);
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

class SophieeApp extends StatelessWidget {
  const SophieeApp({super.key, required this.screen, required this.navigator});
  final Widget screen;
  final GlobalKey<NavigatorState> navigator;

  @override
  Widget build(BuildContext context) {
    systemChromeMethod();

    return CustomMaterialApp(navigatorKey: navigator, screen: screen);
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
