import 'package:flutter/material.dart';
import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/profile_page_card_one_body_component.dart';

class ProfilePageCardOneBody extends StatelessWidget {
  const ProfilePageCardOneBody({
    super.key,
    required this.size,
    required this.isDark,
    required this.user,
    required this.onTap,
    required this.follower,
    required this.following,
  });

  final Size size;
  final bool isDark;
  final UserModel user;
  final Function() onTap;
  final GetFollowersCubit follower;
  final GetFollowingCubit following;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: size.width * .035,
          top: size.width * .02,
          left: size.width * .035),
      child: ProfilePageCardOneBodyComponent(
          size: size,
          isDark: isDark,
          user: user,
          onTap: onTap,
          follower: follower,
          following: following),
    );
  }
}
