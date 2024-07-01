import 'package:flutter/material.dart';

class MessageForwardTextHeader extends StatelessWidget {
  const MessageForwardTextHeader(
      {super.key, required this.isDark, this.top = 0.0, required this.text});

  final bool isDark;
  final String text;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16, top: top),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: isDark ? Colors.white : Colors.black)));
  }
}
