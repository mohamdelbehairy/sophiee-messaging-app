import 'package:flutter/material.dart';

class LivePageAlertDialog extends StatelessWidget {
  const LivePageAlertDialog({super.key, required this.isHost});
  final bool isHost;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[900]!.withOpacity(0.9),
      title: Text(isHost ? "End this live" : "Leave this live",
          style: const TextStyle(color: Colors.white70)),
      content: Text(
          isHost
              ? "Are you sure you want to end the live?"
              : "Are you sure you want to leave the live?",
          style: const TextStyle(color: Colors.white70)),
      actions: [
        ElevatedButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        ElevatedButton(
            child: const Text("Exit"),
            onPressed: () => Navigator.of(context).pop(true)),
      ],
    );
  }
}
