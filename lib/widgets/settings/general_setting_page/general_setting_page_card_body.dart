import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/pages/edit_profile_page.dart';
import 'package:sophiee/pages/setting/chat_wallpaper_page.dart';

import '../../../constants.dart';
import '../../../models/setting_card_model.dart';
import '../../../pages/setting/notification_setting_page.dart';
import '../card_body_details.dart';

class GeneralSettingPageCardBody extends StatelessWidget {
  const GeneralSettingPageCardBody(
      {super.key, required this.size, required this.isDark});

  final Size size;
  final bool isDark;

  static List<SettingCardModel> items = [
    SettingCardModel(
        icon: Icons.person,
        text: 'Edit Profile',
        color: Colors.indigoAccent.shade400,
        onTap: () => getnav.Get.to(() => const EditProfilePage(),
            transition: getnav.Transition.rightToLeft)),
    SettingCardModel(
        icon: Icons.notifications_active,
        text: 'Notifications',
        color: Colors.pink.shade400,
        onTap: () => getnav.Get.to(() => const NotificationSettingPage(),
            transition: getnav.Transition.rightToLeft)),
    SettingCardModel(
        icon: FontAwesomeIcons.image,
        text: 'Chat Wallpaper',
        color: const Color(0xffB338E0),
        onTap: () => getnav.Get.to(() => const ChatWallpaperpage(),
            transition: getnav.Transition.rightToLeft)),
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? cardDarkModeBackground : Colors.white,
      elevation: isDark ? 1 : 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 4),
          child: CardBodyDetails(items: items, size: size, isDark: isDark)),
    );
  }
}
