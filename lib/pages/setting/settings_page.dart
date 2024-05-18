import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/connectivity/connectivity_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/utils/shimmer/home/settings/settings_page_shimmer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/widgets/settings/settings_page_body.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isDark = context.read<LoginCubit>().isDark;
    return Scaffold(
      body: BlocBuilder<ConnectivityCubit, ConnectivityResult>(
        builder: (context, state) {
          if (state == ConnectivityResult.wifi ||
              state == ConnectivityResult.mobile ||
              state == ConnectivityResult.vpn) {
            return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
              builder: (context, userDataState) {
                if (userDataState is GetUserDataSuccess &&
                    userDataState.userModel.isNotEmpty) {
                  final currentUser = FirebaseAuth.instance.currentUser;
                  if (currentUser != null) {
                    final userData = userDataState.userModel.firstWhere(
                        (element) => element.userID == currentUser.uid);
                    return SettingsPageBody(
                        size: size, isDark: isDark, user: userData);
                  } else {
                    return Container();
                  }
                } else {
                  return Container();
                }
              },
            );
          } else {
            return SettingsPageShimmer(size: size);
          }
        },
      ),
    );
  }
}
