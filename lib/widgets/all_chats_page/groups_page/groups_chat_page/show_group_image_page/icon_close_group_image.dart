import 'package:flutter/material.dart';

class IconCloseGroupImage extends StatelessWidget {
  const IconCloseGroupImage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.width * .15,
      left: size.width * .05,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(Icons.close, color: Colors.white, size: size.height * .03),
      ),
    );
  }
}
