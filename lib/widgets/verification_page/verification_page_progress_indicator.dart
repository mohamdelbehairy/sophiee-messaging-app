import 'package:flutter/material.dart';

class VerificationPageProgressIndicator extends StatelessWidget {
  const VerificationPageProgressIndicator({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
            color: isDark ? Colors.white : const Color(0xff3a4352)));
  }
}