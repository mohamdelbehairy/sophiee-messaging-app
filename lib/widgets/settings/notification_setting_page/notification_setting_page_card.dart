import 'package:flutter/material.dart';

import 'notification_setting_page_card_body.dart';

class NotificationSettingPageCard extends StatelessWidget {
  const NotificationSettingPageCard(
      {super.key, required this.size, required this.isDark});

  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
      child: Container(
        width: size.width,
        decoration: const BoxDecoration(
            color: Colors.transparent,
            boxShadow: [BoxShadow(blurRadius: 0, color: Colors.transparent)]),
        child: NotificationSettingPageCardBody(isDark: isDark, size: size),
      ),
    );
  }
}
