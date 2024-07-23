import 'package:flutter/material.dart';

import '../constants.dart';

Future<dynamic> customShowDialog(
    {required BuildContext context,
    required String contentText,
    // required Color backgroundColor,
    required Function() okFunction,
    required String doneButtonText,
    String? title,
    required bool isDark}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor:
                isDark ? cardDarkModeBackground : cardLightModeBackground,
            content: Text(contentText,
                style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w100,
                    fontSize: 16)),
            title: title != null
                ? Text(title,
                    style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w100,
                        fontSize: 18))
                : null,
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel',
                      style: TextStyle(
                        color: isDark ? Colors.white60 : Colors.black54,
                      ))),
              TextButton(
                onPressed: okFunction,
                child: Text(doneButtonText,
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87,
                    )),
              ),
            ]);
      });
}
