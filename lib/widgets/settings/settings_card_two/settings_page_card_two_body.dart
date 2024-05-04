import 'package:sophiee/cubit/auth/auth_settings/auth_settings_cubit.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophiee/widgets/settings/settings_card_two/card_two_body_componenet.dart';
import 'package:sophiee/widgets/settings/settings_card_two/logout_show_dialog.dart';

class SettingsPageCardTwoBody extends StatelessWidget {
  const SettingsPageCardTwoBody(
      {super.key, required this.size, required this.onPressed});
  final Size size;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthSettingsCubit, AuthSettingsState>(
      listener: (context, state) async {
        if (state is EmailSignOutSuccess ||
            state is GoogleSignOutSuccess ||
            state is FacebookSignOutSuccess) {
          context.read<GetFriendsCubit>().emit(GetFriendsInitial());
          final shar = await SharedPreferences.getInstance();
          shar.setString('isFirstTimeUser', 'done');
          debugPrint(shar.getString('isFirstTimeUser'));
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return CardTwoBodyComponenet(
              size: size,
              onTap: () {
                return logoutShowDialog(context: context, onPressed: onPressed);
              });
        },
      ),
    );
  }
}
