import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';

Future<dynamic> logoutShowDialog(
    {required BuildContext context, required Function() onPressed}) {
  var isDark = context.read<LoginCubit>().isDark;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor:
              isDark ? cardDarkModeBackground : cardLightModeBackground,
          title: Text("Logout",
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold)),
          content: Text("Are you sure you want to log out?",
              style: TextStyle(color: isDark ? Colors.white : Colors.black)),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    backgroundColor: isDark
                        ? cardDarkModeBackground
                        : cardLightModeBackground),
                child: Text("Cancel",
                    style: TextStyle(
                        color: isDark ? Colors.white60 : Colors.black54,
                        fontWeight: FontWeight.bold)),
                onPressed: () => Navigator.of(context).pop(false)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: isDark
                      ? cardDarkModeBackground
                      : cardLightModeBackground),
              onPressed: onPressed,
              child: Text("Logout",
                  style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        );
      });
}
