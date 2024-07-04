import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/follower/follower_cubit.dart';
import 'package:sophiee/cubit/friends/friends_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_friend_item_two_body.dart';

class MyFriendItemTwo extends StatelessWidget {
  const MyFriendItemTwo(
      {super.key, required this.user, this.infoCalls, this.followButton});
  final UserModel user;
  final Widget? infoCalls, followButton;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final follower = context.read<FollowerCubit>();
    final friend = context.read<FriendsCubit>();
    final isDark = context.read<LoginCubit>().isDark;

    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
        builder: (context, state) {
      if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          final userData = state.userModel
              .firstWhere((element) => element.userID == currentUser.uid);
          return MyFriendItemTwoBody(
              followButton: followButton,
              infoCalls: infoCalls,
              follower: follower,
              user: user,
              friend: friend,
              userData: userData,
              isDark: isDark,
              size: size);
        } else {
          return Container();
        }
      } else {
        return Container();
      }
    });
  }
}
