import 'package:flutter/material.dart';

Future<dynamic> customShowDialog(
      {required BuildContext context,
      required String contentText,
      required Color backgroundColor,
      required Function() okFunction,
      required String doneButtonText
      }) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: backgroundColor,
              content: Text(contentText),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child:
                        const Text('Cancle', style: TextStyle(color: Colors.white))),
                TextButton(
                  onPressed: okFunction,
                  child: Text(doneButtonText, style: const TextStyle(color: Colors.white)),
                ),
              ]);
        });
  }


