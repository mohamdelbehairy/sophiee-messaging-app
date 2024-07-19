import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_page_app_bar_title_body.dart';

class ChatPageAppBarTitle extends StatelessWidget {
  const ChatPageAppBarTitle(
      {super.key, required this.user, required this.userData});
  final UserModel user, userData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var isDark = context.read<LoginCubit>().isDark;

    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = user.userID;
          final data = state.userModel
              .firstWhere((element) => element.userID == currentUser);

          String text;
          int differenceInMinutes =
              Timestamp.now().toDate().difference(data.onlineStatue).inMinutes;
          int differenceInHours =
              Timestamp.now().toDate().difference(data.onlineStatue).inHours;
          int differenceInDays =
              Timestamp.now().toDate().difference(data.onlineStatue).inDays;

          if (userData.blockUsers.contains(user.userID) ||
              user.blockUsers.contains(userData.userID)) {
            text = 'last seen for a long time';
          } else if (!user.isLastSeendAndOnline) {
            text = 'last seen recently';
          } else if (differenceInMinutes < 1) {
            text = 'active now';
          } else if (differenceInMinutes < 60) {
            if (differenceInMinutes == 1) {
              text = 'last active $differenceInMinutes minute ago';
            } else {
              text = 'last active $differenceInMinutes minutes ago';
            }
          } else if (differenceInHours < 24) {
            if (differenceInHours == 1) {
              text = 'last active $differenceInHours hour ago';
            } else {
              text = 'Last Active $differenceInHours hours ago';
            }
          } else if (differenceInDays < 7) {
            if (differenceInDays == 1) {
              text = 'last active $differenceInDays day ago';
            } else {
              text = 'last active $differenceInDays days ago';
            }
          } else {
            int weeks = differenceInDays ~/ 7;

            if (weeks == 1) {
              text = 'last active 1 week ago';
            } else {
              text = 'last active $weeks weeks';
              text += ' ago';
            }
          }
          return ChatPageAppBarTitleBody(
              userData: userData,
              user: user,
              data: data,
              size: size,
              isDark: isDark,
              text: text);
        } else {
          return Container();
        }
      },
    );
  }
}
