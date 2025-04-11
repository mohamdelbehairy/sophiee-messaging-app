import 'package:flutter/material.dart';
import 'package:sophiee/custom_material_app.dart';

class SophieeApp extends StatelessWidget {
  const SophieeApp(
      {super.key, required this.screen, required this.navigatorKey});
  final Widget screen;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    

    return CustomMaterialApp(screen: screen, navigatorKey: navigatorKey);
  }
}
