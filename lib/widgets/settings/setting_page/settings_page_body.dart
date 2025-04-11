import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/delete_account_page.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../../utils/methods/logout_method.dart';
import 'setting_page_body_details.dart';

class SettingsPageBody extends StatefulWidget {
  const SettingsPageBody(
      {super.key,
      required this.size,
      required this.isDark,
      required this.user});

  final Size size;
  final bool isDark;
  final UserModel user;

  @override
  State<SettingsPageBody> createState() => _SettingsPageBodyState();
}

class _SettingsPageBodyState extends State<SettingsPageBody> {
  bool showProgressIndicator = false;

  @override
  Widget build(BuildContext context) {
    return SettingPageBodyDetails(
        showProgressIndicator: showProgressIndicator,
        size: widget.size,
        user: widget.user,
        deleteAccount: deleteAccount,
        logoutAccount: logoutAccount);
  }

  void logoutAccount() async {
    Navigator.pop(context);
    showProgressIndicator = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    await logOut(context: context, user: widget.user);
    showProgressIndicator = false;
    setState(() {});
  }

  void deleteAccount() async {
    Navigation.pop(context);
    showProgressIndicator = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigation.push(context, const DeleteAccountPage());
    showProgressIndicator = false;
    setState(() {});
  }
}
