import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/profile_page_card_one_body.dart';

class ProfilePageCardOne extends StatelessWidget {
  const ProfilePageCardOne(
      {super.key, required this.onTap, required this.user, required this.size});

  final Function() onTap;
  final UserModel user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    var follower = context.read<GetFollowersCubit>();
    var following = context.read<GetFollowingCubit>();

    return ProfilePageCardOneBody(
        size: size,
        isDark: isDark,
        user: user,
        onTap: onTap,
        follower: follower,
        following: following);
  }
}
