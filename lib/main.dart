import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophiee/custom_material_app.dart';
import 'package:sophiee/firebase_options.dart';
import 'package:sophiee/pages/auth/provider_auth_page.dart';
import 'package:sophiee/pages/home_page.dart';
import 'package:sophiee/pages/on_boardring_page.dart';
import 'package:sophiee/services/theme.dart';
import 'package:sophiee/simple_observe_bloc.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await _init();
  FlutterNativeSplash.remove();
}

_init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('userID');
  final isFirstTimeUser = prefs.getString('isFirstTimeUser');
  if (token != null &&
      (FirebaseAuth.instance.currentUser!.phoneNumber != null ||
          FirebaseAuth.instance.currentUser!.emailVerified)) {
    // UpdateUserOnline.checkOnline();
    return runApp(const SophieeApp(screen: HomePage()));
  } else if (token == null && isFirstTimeUser != null) {
    return runApp(const SophieeApp(screen: ProviderAuthPage()));
  } else {
    return runApp(const SophieeApp(screen: OnBoardringPage()));
  }
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
