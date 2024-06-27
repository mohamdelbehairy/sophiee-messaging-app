import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';

class NoGroupPageBodyImage extends StatelessWidget {
  const NoGroupPageBodyImage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Image.asset(noGroupChat,
            fit: BoxFit.cover, height: size.height * .35));
  }
}