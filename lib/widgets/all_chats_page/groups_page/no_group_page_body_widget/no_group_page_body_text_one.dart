import 'package:flutter/material.dart';

class NoGroupPageBodyTextOne extends StatelessWidget {
  const NoGroupPageBodyTextOne(
      {super.key, required this.isDark, required this.size});

  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Text('No Group Chat',
        style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: size.width * .065));
  }
}