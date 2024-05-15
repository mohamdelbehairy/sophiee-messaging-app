import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sophiee/constants.dart';

class ThemeModeService {
  ThemeData lightMode({required BuildContext context}) {
    final size = MediaQuery.of(context).size;
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xfff5f5f5),
      //fefeff
      fontFamily: 'SFPRODISPLAYBOLD',
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: size.width * .06,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.white, size: size.height * .034),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: size.width * .042,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: size.width * .032,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  ThemeData darkMode({required BuildContext context}) {
    final size = MediaQuery.of(context).size;
    return ThemeData(
        scaffoldBackgroundColor: kDarkModeBackgroundColor,
        fontFamily: 'SFPRODISPLAYBOLD',
        iconTheme: const IconThemeData(color: Colors.white),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: size.width * .06,
              fontWeight: FontWeight.bold),
          iconTheme:
              IconThemeData(color: Colors.white, size: size.height * .034),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: size.width * .042,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
              color: Colors.white,
              fontSize: size.width * .032,
              fontWeight: FontWeight.bold),
        ));
  }
}
