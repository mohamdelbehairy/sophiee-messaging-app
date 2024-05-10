import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sophiee/custom_material_app.dart';
import 'package:sophiee/firebase_options.dart';
import 'package:sophiee/run_app_init.dart';
import 'package:sophiee/services/theme.dart';
import 'package:sophiee/simple_observe_bloc.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await runAppInit();

  FlutterNativeSplash.remove();
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('message: ${message.notification!.title}');
  print('message: ${message.notification!.body}');
  print('data: ${message.data}');
}

class SophieeApp extends StatelessWidget {
  const SophieeApp({super.key, required this.screen});
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    systemChromeMethod();
    ThemeModeService themeModeService = ThemeModeService();

    return CustomMaterialApp(
        themeModeService: themeModeService, screen: screen);
  }

  void systemChromeMethod() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light));
  }
}
