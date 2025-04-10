import 'package:flutter/material.dart';

Future<dynamic> deleteMessageShowDialog(
      {required BuildContext context, required Function() onPressed}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.blue[900]!.withValues(alpha:  0.9),
            title: const Text("Delete message",
                style: TextStyle(color: Colors.white70)),
            content: const Text("Are you sure wnt to delete this message?",
                style: TextStyle(color: Colors.white70)),
            actions: [
              ElevatedButton(
                  child: const Text("Cancel"),
                  onPressed: () => Navigator.of(context).pop(false)),
              ElevatedButton(
                onPressed: onPressed,
                child: const Text("Delete"),
              ),
            ],
          );
        });
  }