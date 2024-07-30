import 'package:sophiee/cubit/auth/auth_settings/auth_settings_cubit.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophiee/cubit/search/recent_search/recent_search_cubit.dart';
import 'package:sophiee/cubit/user_date/user_token/user_token_cubit.dart';
import 'package:sophiee/widgets/settings/settings_card_two/card_two_body_componenet.dart';

import '../../../utils/methods/initial_state.dart';

class SettingsPageCardTwoBody extends StatelessWidget {
  const SettingsPageCardTwoBody(
      {super.key,
      required this.size,
      required this.loginAccount,
      required this.deleteAccount});
  final Size size;
  final Function() loginAccount, deleteAccount;

  @override
  Widget build(BuildContext context) {
    var removeToken = context.read<UserTokenCubit>();
    return BlocListener<AuthSettingsCubit, AuthSettingsState>(
      listener: (context, state) async {
        if (state is GoogleSignOutSuccess || state is FacebookSignOutSuccess) {
          InitialState.initFriendState(context);
          context.read<RecentSearchCubit>().recentSearchList.clear();
          await removeToken.updateUserToken(token: '');
          final shar = await SharedPreferences.getInstance();
          shar.setString('isFirstTimeUser', 'done');
          debugPrint(shar.getString('isFirstTimeUser'));
        }
        if (state is EmailSignOutSuccess) {
          final shar = await SharedPreferences.getInstance();
          shar.setString('isFirstTimeUser', 'done');
          debugPrint(shar.getString('isFirstTimeUser'));
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return CardTwoBodyComponenet(
              deleteAccount: deleteAccount, size: size, onTap: loginAccount);
        },
      ),
    );
  }
}
