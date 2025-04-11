import 'package:flutter/material.dart';
import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/models/users_model.dart';

import 'package:sophiee/widgets/profile_page/profile_page_card_one/profile_page_card_one_followers.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/profile_page_card_one_following.dart';

import 'profile_page_card_one_posts.dart';

class ProfilePageCardOneProfileDetails extends StatelessWidget {
  const ProfilePageCardOneProfileDetails(
      {super.key,
      required this.user,
      required this.follower,
      required this.following,
      required this.size,
      required this.isDark});

  final UserModel user;
  final GetFollowersCubit follower;
  final GetFollowingCubit following;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isDark
                ? Colors.grey.withValues(alpha:  .01)
                : const Color(0xfff9f8f8).withValues(alpha:  .7),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(size.width * .02),
                bottomRight: Radius.circular(size.width * .02))),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
             ProfilePageCardOnePosts(size: size),
            ProfilePageCardOneFollowers(
                user: user, follower: follower, size: size),
            ProfilePageCardOneFollowing(
                user: user, following: following, size: size),
          ]),
        ),
      ),
    );
  }
}
