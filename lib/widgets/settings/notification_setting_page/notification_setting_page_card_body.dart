import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';

import '../../../constants.dart';
import 'card_body_component.dart';

class NotificationSettingPageCardBody extends StatelessWidget {
  const NotificationSettingPageCardBody(
      {super.key, required this.isDark, required this.size});

  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final userData = state.userModel.firstWhere((element) =>
              element.userID == FirebaseAuth.instance.currentUser!.uid);
          return Card(
              color: isDark ? cardDarkModeBackground : Colors.white,
              elevation: isDark ? 1 : 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: CardBodyComponent(
                  size: size, isDark: isDark, userData: userData));
        } else {
          return Container();
        }
      },
    );
  }
}
