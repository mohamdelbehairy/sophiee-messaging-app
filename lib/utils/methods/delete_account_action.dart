import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../cubit/auth/auth_settings/auth_settings_cubit.dart';
import '../../cubit/auth/facebook_auth/facebook_auth_cubit.dart';
import '../../cubit/auth/google_auth/google_auth_cubit.dart';
import '../../cubit/delete_account/delete_account_cubit.dart';
import '../../pages/auth/provider_auth_page.dart';

Future<void> deleteAccountAction(BuildContext context) async {
  var signOut = context.read<AuthSettingsCubit>();
  var deleteAccount = context.read<DeleteAccountCubit>();
  context.read<GoogleAuthCubit>().isLoading = false;
  context.read<FacebookAuthCubit>().isLoading = false;

  await signOut.googleSignOut();
  await signOut.facebookSignOut();
  await signOut.signOut();
  // UserCallInit.onUserLogout();
  final prefs = await SharedPreferences.getInstance();
  var userID = prefs.getString('storeUser');
  // ignore: use_build_context_synchronously
  Navigation.go(context, const ProviderAuthPage());

  await Future.delayed(const Duration(seconds: 1));
  await deleteAccount.deleteUserInfo(userID: userID);
  await prefs.remove('storeUser');
}
