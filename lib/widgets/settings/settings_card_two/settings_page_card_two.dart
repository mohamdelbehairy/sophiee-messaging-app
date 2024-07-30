import 'package:flutter/material.dart';
import 'package:sophiee/widgets/settings/settings_card_two/settings_page_card_two_body.dart';

class SettingsPageCardTwo extends StatelessWidget {
  const SettingsPageCardTwo(
      {super.key,
      required this.size,
      required this.loginAccount,
      required this.deleteAccount});

  final Size size;
  final Function() loginAccount, deleteAccount;

  @override
  Widget build(BuildContext context) {
    return SettingsPageCardTwoBody(
        deleteAccount: deleteAccount, size: size, loginAccount: loginAccount);
  }
}
