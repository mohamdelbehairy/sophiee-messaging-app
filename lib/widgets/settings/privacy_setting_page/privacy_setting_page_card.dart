import 'package:flutter/material.dart';

import 'privacy_setting_page_card_body.dart';

class PrivacySettingPageCard extends StatelessWidget {
  const PrivacySettingPageCard({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
        child: Container(
            width: size.width,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(blurRadius: 0, color: Colors.transparent)
                ]),
            child: PrivacySettingPageCardBody(size: size)));
  }
}
