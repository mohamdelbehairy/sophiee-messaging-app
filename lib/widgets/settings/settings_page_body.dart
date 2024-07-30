import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/auth_settings/auth_settings_cubit.dart';
import 'package:sophiee/cubit/auth/facebook_auth/facebook_auth_cubit.dart';
import 'package:sophiee/cubit/auth/google_auth/google_auth_cubit.dart';
import 'package:sophiee/cubit/user_date/user_token/user_token_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/auth/provider_auth_page.dart';
import 'package:sophiee/services/calls/user_call_init.dart';
import 'package:get/get.dart' as getnav;

import '../../cubit/delete_account/delete_account_cubit.dart';
import '../../utils/methods/delete_account_action.dart';
import 'setting_page_body_componenet.dart';

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
    var deleteAccount = context.read<DeleteAccountCubit>();
    return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) async {
        if (state is DeleteAccountSuccess) {
          await deleteAccountAction(context);
        }
      },
      builder: (context, state) {
        return SettingPageBodyComponent(
            deleteAccount: deleteAccount,
            onPressed: onPressed,
            user: widget.user,
            size: widget.size,
            inAsyncCall:
                state is DeleteAccountLoading ? true : showProgressIndicator);
      },
    );
  }

  Future<void> logOut() async {
    var signOut = context.read<AuthSettingsCubit>();
    if (widget.user.isGoogleAuth != null) {
      context.read<GoogleAuthCubit>().isLoading = false;
      await signOut.googleSignOut();
    } else if (widget.user.isFacebookAuth != null) {
      context.read<FacebookAuthCubit>().isLoading = false;
      await signOut.facebookSignOut();
    } else {
      var removeToken = context.read<UserTokenCubit>();
      await removeToken.updateUserToken(token: '');
      await signOut.signOut();
    }
    UserCallInit.onUserLogout();
    getnav.Get.to(() => const ProviderAuthPage(),
        transition: getnav.Transition.rightToLeft);
  }

  void onPressed() async {
    Navigator.pop(context);
    showProgressIndicator = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    logOut();
    showProgressIndicator = false;
    setState(() {});
  }
}

