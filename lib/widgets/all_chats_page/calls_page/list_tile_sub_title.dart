import 'package:flutter/material.dart';

class ListTileSubTitle extends StatelessWidget {
  const ListTileSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.phone_missed, size: 14, color: Colors.red),
        const SizedBox(width: 4),
        Text('You missed 3 voice call',
            style: TextStyle(
                // fontSize: 15,
                color: Colors.red.shade300))
      ],
    );
  }
}
