import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophiee/widgets/settings/settings_card_one/settings_page_card_one_body.dart';

import '../../../models/users_model.dart';

class SettingsPageCardOne extends StatefulWidget {
  const SettingsPageCardOne(
      {super.key, required this.size, required this.userData});
  final Size size;
  final UserModel userData;

  @override
  State<SettingsPageCardOne> createState() => _SettingsPageCardOneState();
}

class _SettingsPageCardOneState extends State<SettingsPageCardOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
      child: SettingsPageCardOneBody(
        userData: widget.userData,
        size: widget.size,
        onPressed: (value) {
          setState(() {});
          saveDarkMode(isDarkMode: value);
          if (!value) {
            context.read<LoginCubit>().changeAppTheme();
          } else {
            context.read<LoginCubit>().changeAppTheme();
          }
        },
      ),
    );
  }

  Future<void> saveDarkMode({required bool isDarkMode}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
  }

  Future<bool?> getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDarkMode');
  }
}
