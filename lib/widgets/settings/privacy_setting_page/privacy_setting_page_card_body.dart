import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';
import '../../../cubit/auth/login/login_cubit.dart';
import '../../all_chats_page/groups_page/groups_chat_page/groups_permissions_page/custom_switch_icon.dart';
import '../custom_items_two.dart';

class PrivacySettingPageCardBody extends StatelessWidget {
  const PrivacySettingPageCardBody({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Card(
      color: isDark ? cardDarkModeBackground : Colors.white,
      elevation: isDark ? 1 : 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 20, bottom: 4),
        child: Column(
          children: [
            CustomItemsTwo(
                color: Colors.indigoAccent.shade400,
                icon: Icons.app_registration_outlined,
                widget: CustomSwitchIcon(
                    size: size, onChanged: (value) async {}, value: true),
                iconSize: size.width * .05,
                text: 'Phone Number & Email',
                textColor: isDark ? Colors.white : Colors.black,
                size: size),
            const SizedBox(height: 8),
            CustomItemsTwo(
                color: kPrimaryColor,
                icon: Icons.group_outlined,
                widget: CustomSwitchIcon(
                    size: size, onChanged: (value) async {}, value: false),
                iconSize: size.width * .05,
                text: 'Last Seen & online',
                textColor: isDark ? Colors.white : Colors.black,
                size: size),
            const SizedBox(height: 8),
            CustomItemsTwo(
                color: const Color(0xffB338E0),
                icon: Icons.photo_outlined,
                widget: CustomSwitchIcon(
                    size: size, onChanged: (value) async {}, value: false),
                iconSize: size.width * .05,
                text: 'Profile Photos',
                textColor: isDark ? Colors.white : Colors.black,
                size: size),
            const SizedBox(height: 8),
            CustomItemsTwo(
                color: Colors.orange,
                icon: FontAwesomeIcons.solidCalendarDays,
                widget: CustomSwitchIcon(
                    size: size, onChanged: (value) async {}, value: false),
                iconSize: size.width * .04,
                text: 'Date of Birth',
                textColor: isDark ? Colors.white : Colors.black,
                size: size),
            const SizedBox(height: 8),
            CustomItemsTwo(
                color: const Color(0xfffe6e6e),
                icon: FontAwesomeIcons.circleInfo,
                widget: CustomSwitchIcon(
                    size: size, onChanged: (value) async {}, value: true),
                iconSize: size.width * .04,
                text: 'Bio & Nickname',
                textColor: isDark ? Colors.white : Colors.black,
                size: size),
            const SizedBox(height: 8),
            CustomItemsTwo(
                color: Colors.pink.shade400,
                icon: FontAwesomeIcons.phone,
                widget: CustomSwitchIcon(
                    size: size, onChanged: (value) async {}, value: true),
                iconSize: size.width * .04,
                text: 'Audio & Video calls',
                textColor: isDark ? Colors.white : Colors.black,
                size: size),
          ],
        ),
      ),
    );
  }
}
