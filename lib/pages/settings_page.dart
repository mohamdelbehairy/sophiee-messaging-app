import 'package:sophiee/cubit/connectivity/connectivity_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/utils/shimmer/home/settings/settings_page_shimmer.dart';
import 'package:sophiee/widgets/settings/app_bar.dart';
import 'package:sophiee/widgets/settings/card_one.dart';
import 'package:sophiee/widgets/settings/card_two.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<ConnectivityCubit, ConnectivityResult>(
        builder: (context, state) {
          if (state == ConnectivityResult.wifi ||
              state == ConnectivityResult.mobile) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const AppBarSettings(),
                  const CustomCardOne(),
                  BlocBuilder<GetUserDataCubit, GetUserDataStates>(
                    builder: (context, state) {
                      if (state is GetUserDataSuccess) {
                        final currentUser = FirebaseAuth.instance.currentUser;
                        if (currentUser != null) {
                          final userData = state.userModel.firstWhere(
                              (element) => element.userID == currentUser.uid);
                          return CustomCardTwo(size: size, user: userData);
                        } else {
                          return Container();
                        }
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            );
          } else {
            return SettingsPageShimmer(size: size);
          }
        },
      ),
    );
  }
}
