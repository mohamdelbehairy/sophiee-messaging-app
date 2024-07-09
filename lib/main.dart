import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sophiee/custom_material_app.dart';
import 'package:sophiee/firebase_options.dart';
import 'package:sophiee/run_app_init.dart';
import 'package:sophiee/services/theme.dart';
import 'package:sophiee/simple_observe_bloc.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import 'utils/system_chrome_method.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  Bloc.observer = SimpleBlocObserver();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  await Future.wait([
    dotenv.load(fileName: ".env"),
    ZegoUIKit().initLog().then((value) {
      ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
        [ZegoUIKitSignalingPlugin()],
      );
      runAppInit();
    }),
  ]);
  FlutterNativeSplash.remove();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class SophieeApp extends StatelessWidget {
  const SophieeApp({super.key, required this.screen});
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    systemChromeMethod();
    ThemeModeService themeModeService = ThemeModeService();

    return CustomMaterialApp(
        navigatorKey: navigatorKey,
        themeModeService: themeModeService,
        screen: screen);
  }
}
