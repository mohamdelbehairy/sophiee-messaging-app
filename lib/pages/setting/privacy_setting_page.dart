import 'package:flutter/material.dart';
import 'package:sophiee/widgets/settings/settings_page_app_bar.dart';

import '../../widgets/settings/privacy_setting_page/privacy_setting_page_card.dart';

class PrivacySettingPage extends StatelessWidget {
  const PrivacySettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          SettingsPageAppBar(
              size: size,
              appParTitle: 'Privacy',
              arrowIcon:
                  const Icon(Icons.arrow_back, color: Colors.white, size: 30)),
          PrivacySettingPageCard(size: size)
        ],
      ),
    );
  }
}
