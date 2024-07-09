import 'package:flutter/material.dart';

Future<dynamic> customShowDialog({
  required BuildContext context,
  required String contentText,
  required Color backgroundColor,
  required Function() okFunction,
  required String doneButtonText,
  String? title,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: backgroundColor,
            content: Text(contentText),
            title: title != null
                ? Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        fontSize: 18))
                : null,
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancle',
                      style: TextStyle(color: Colors.white70))),
              TextButton(
                onPressed: okFunction,
                child: Text(doneButtonText,
                    style: const TextStyle(color: Colors.white)),
              ),
            ]);
      });
}
