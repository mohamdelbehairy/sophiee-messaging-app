import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophiee/widgets/settings/settings_card_one/settings_page_card_one_body.dart';

class SettingsPageCardOne extends StatefulWidget {
  const SettingsPageCardOne({super.key, required this.size});
  final Size size;

  @override
  State<SettingsPageCardOne> createState() => _SettingsPageCardOneState();
}

class _SettingsPageCardOneState extends State<SettingsPageCardOne> {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.size.width * .035,
          vertical: widget.size.width * .035),
      child: SettingsPageCardOneBody(
        size: widget.size,
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
