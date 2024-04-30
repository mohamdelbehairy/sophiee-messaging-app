import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/widgets/settings/custom_items_one.dart';
import 'package:sophiee/widgets/settings/custom_items_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomCardOne extends StatefulWidget {
  const CustomCardOne({super.key});

  @override
  State<CustomCardOne> createState() => _CustomCardOneState();
}

class _CustomCardOneState extends State<CustomCardOne> {
  bool isDarkMode = true;

  @override
  void initState() {
    super.initState();
    getDarkMode().then((value) {
      setState(() {
        isDarkMode = value ?? true;
      });
    });
  }

  Future<void> saveDarkMode({required bool isDarkMode}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
  }

  Future<bool?> getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDarkMode');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
      child: Container(
        height: 330,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
          BoxShadow(
            blurRadius: 40,
            color: context.read<LoginCubit>().isDark
                ? Colors.grey.withOpacity(.1)
                : Colors.grey.withOpacity(.4),
          )
        ]),
        child: Card(
          color: context.read<LoginCubit>().isDark
              ? const Color(0xff2b2c33)
              : Colors.white,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                CustomItemsOne(
                  onPressed: () {
                    setState(() {
                      isDarkMode = !isDarkMode;
                    });
                    saveDarkMode(isDarkMode: isDarkMode);
                    if (!isDarkMode) {
                      context.read<LoginCubit>().changeAppTheme();
                    } else {
                      context.read<LoginCubit>().changeAppTheme();
                    }
                  },
                  iconChange: Icons.brightness_4_outlined,
                  text: 'Dark Mode',
                  icon: FontAwesomeIcons.solidMoon,
                  color: context.read<LoginCubit>().isDark
                      ? Colors.grey
                      : Colors.black54,
                ),
                const SizedBox(height: 12),
                CustomItemsOne(
                  onPressed: () {},
                  iconChange: Icons.lock,
                  text: 'Profile Lock',
                  icon: Icons.person,
                  color: kPrimaryColor,
                ),
                const SizedBox(height: 12),
                CustomItemsTwo(
                  textColor: context.read<LoginCubit>().isDark
                      ? Colors.white
                      : Colors.black,
                  icon2: FontAwesomeIcons.chevronRight,
                  text: 'Chat Customize',
                  size: 14,
                  icon: FontAwesomeIcons.solidComments,
                  color: Colors.indigoAccent.shade400,
                ),
                const SizedBox(height: 12),
                CustomItemsTwo(
                  icon2: FontAwesomeIcons.chevronRight,
                  text: 'Notification',
                  size: 20,
                  icon: Icons.notifications_active,
                  color: Colors.pink.shade400,
                  textColor: context.read<LoginCubit>().isDark
                      ? Colors.white
                      : Colors.black,
                ),
                const SizedBox(height: 12),
                CustomItemsTwo(
                  textColor: context.read<LoginCubit>().isDark
                      ? Colors.white
                      : Colors.black,
                  icon2: FontAwesomeIcons.chevronRight,
                  text: 'Privacy',
                  size: 16,
                  icon: FontAwesomeIcons.shield,
                  color: const Color(0xffB338E0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
