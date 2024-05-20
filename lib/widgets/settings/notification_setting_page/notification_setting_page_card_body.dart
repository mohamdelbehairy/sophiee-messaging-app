import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'card_body_component.dart';

class NotificationSettingPageCardBody extends StatelessWidget {
  const NotificationSettingPageCardBody(
      {super.key, required this.isDark, required this.size});

  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: isDark ? cardDarkModeBackground : Colors.white,
        elevation: isDark ? 1 : 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: CardBodyComponent(size: size, isDark: isDark));
  }
}
