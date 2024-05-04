  import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';

Future<dynamic> logoutShowDialog(
      {required BuildContext context, required Function() onPressed}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: kPrimaryColor,
            title:
                const Text("Logout", style: TextStyle(color: Colors.white70)),
            content: const Text("Are you sure you want to log out?",
                style: TextStyle(color: Colors.white70)),
            actions: [
              ElevatedButton(
                  child: const Text("Cancel",
                      style: TextStyle(color: Colors.blue)),
                  onPressed: () => Navigator.of(context).pop(false)),
              ElevatedButton(
                onPressed: onPressed,
                child:
                    const Text("Logout", style: TextStyle(color: Colors.blue)),
              ),
            ],
          );
        });
  }