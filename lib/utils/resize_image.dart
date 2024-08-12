import 'package:flutter/material.dart';

class ResizeImageWidget extends StatelessWidget {
  const ResizeImageWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        maxScale: 5.0,
        minScale: 0.01,
        boundaryMargin: const EdgeInsets.all(20.0),
        child: child);
  }
}
