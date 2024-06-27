import 'package:flutter/material.dart';

class ListTileTrailing extends StatelessWidget {
  const ListTileTrailing({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size.width * .2,
        child: const Row(
          children: [
            Icon(Icons.videocam, color: Color(0xff0ad99b), size: 30),
            SizedBox(width: 10),
            Icon(Icons.call, color: Colors.blue, size: 25)
          ],
        ));
  }
}