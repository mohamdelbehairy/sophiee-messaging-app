import 'package:flutter/material.dart';

class LivePageAlertDialog extends StatelessWidget {
  const LivePageAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[900]!.withOpacity(0.9),
      title:
          const Text("End this live", style: TextStyle(color: Colors.white70)),
      content: const Text("Are you sure you want to end the live?",
          style: TextStyle(color: Colors.white70)),
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
