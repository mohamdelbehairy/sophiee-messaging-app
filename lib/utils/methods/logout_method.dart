import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:get/get.dart' as getnav;

import '../../cubit/auth/auth_settings/auth_settings_cubit.dart';
import '../../cubit/auth/facebook_auth/facebook_auth_cubit.dart';
import '../../cubit/auth/google_auth/google_auth_cubit.dart';
import '../../cubit/user_date/user_token/user_token_cubit.dart';
import '../../pages/auth/provider_auth_page.dart';
import '../../services/calls/user_call_init.dart';

Future<void> logOut({required BuildContext context,required UserModel user}) async {
    var signOut = context.read<AuthSettingsCubit>();
    if (user.isGoogleAuth != null) {
      context.read<GoogleAuthCubit>().isLoading = false;
      await signOut.googleSignOut();
    } else if (user.isFacebookAuth != null) {
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