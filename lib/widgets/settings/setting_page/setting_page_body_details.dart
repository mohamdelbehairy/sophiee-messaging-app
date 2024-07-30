import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../../cubit/auth/login/login_cubit.dart';
import '../../../models/setting_bottom_sheet_model.dart';
import '../../../models/users_model.dart';
import '../delete_account_or_login/delete_account_or_login_bottom_sheet.dart';
import 'setting_page_body_componenet.dart';

class SettingPageBodyDetails extends StatelessWidget {
  const SettingPageBodyDetails(
      {super.key,
      required this.deleteAccount,
      required this.logoutAccount,
      required this.user,
      required this.size,
      required this.showProgressIndicator});
  final Function() deleteAccount, logoutAccount;
  final UserModel user;
  final Size size;
  final bool showProgressIndicator;

  @override
  Widget build(BuildContext context) {
    return SettingPageBodyComponent(
        deleteAccount: () => showModalBottomSheet(
            context: context,
            backgroundColor: context.read<LoginCubit>().isDark
                ? cardDarkModeBackground
                : cardLightModeBackground,
            builder: (context) => DeleteAccountOrLoginBottomSheet(
                    settingBottomSheetModel: SettingBottomSheetModel(
                  title: 'Delete Account?',
                  body:
                      'Are you sure you want to delete your account at\nsophiee, everything will be deleted, clips/posts/\nconversations. this step not reverted!',
                  onTap: deleteAccount,
                  buttonName: 'Delete',
                ))),
        loginAccount: () => showModalBottomSheet(
            context: context,
            backgroundColor: context.read<LoginCubit>().isDark
                ? cardDarkModeBackground
                : cardLightModeBackground,
            builder: (context) => DeleteAccountOrLoginBottomSheet(
                    settingBottomSheetModel: SettingBottomSheetModel(
                  title: 'Are you sure that you want to logout?',
                  titleSize: 20,
                  body:
                      'You have to login again with your username and\npassword if you confirm to logout.',
                  onTap: logoutAccount,
                  buttonName: 'Logout',
                ))),
        user: user,
        size: size,
        inAsyncCall: showProgressIndicator);
  }
}
