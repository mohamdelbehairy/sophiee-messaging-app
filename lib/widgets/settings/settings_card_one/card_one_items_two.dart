import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/pages/setting/general_setting_page.dart';
import 'package:sophiee/pages/setting/privacy_setting_page.dart';
import 'package:sophiee/pages/setting/show_notification_page.dart';
import 'package:sophiee/widgets/settings/custom_items_two.dart';

class CardOneItemsTwo extends StatelessWidget {
  const CardOneItemsTwo({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(children: [
        CustomItemsTwo(
            onTap: () => getnav.Get.to(() => GeneralSettingPage(size: size),
                transition: getnav.Transition.rightToLeft),
            size: size,
            textColor:
                context.read<LoginCubit>().isDark ? Colors.white : Colors.black,
            icon2: FontAwesomeIcons.chevronRight,
            text: 'General',
            iconSize: size.width * .05,
            icon: Icons.settings,
            color: Colors.indigoAccent.shade400),
        const SizedBox(height: 2),
        CustomItemsTwo(
            onTap: () => getnav.Get.to(
                () => const ShowNotificationPage(),
                transition: getnav.Transition.rightToLeft),
            size: size,
            icon2: FontAwesomeIcons.chevronRight,
            text: 'Notification',
            iconSize: size.width * .048,
            icon: Icons.notifications_active,
            color: Colors.pink.shade400,
            textColor: context.read<LoginCubit>().isDark
                ? Colors.white
                : Colors.black),
        const SizedBox(height: 2),
        CustomItemsTwo(
            onTap: () => getnav.Get.to(() => const PrivacySettingPage(),
                transition: getnav.Transition.rightToLeft),
            size: size,
            textColor:
                context.read<LoginCubit>().isDark ? Colors.white : Colors.black,
            icon2: FontAwesomeIcons.chevronRight,
            text: 'Privacy',
            iconSize: size.width * .04,
            icon: FontAwesomeIcons.shield,
            color: const Color(0xffB338E0)),
      ]),
    );
  }
}
