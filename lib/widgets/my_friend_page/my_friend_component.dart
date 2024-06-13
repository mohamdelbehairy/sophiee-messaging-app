import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/follow_status/follow_status_cubit.dart';
import '../../cubit/follower/follower_cubit.dart';
import '../../models/users_model.dart';
import 'my_friend_item_two_details.dart';

class MyFriendItemTwoComponent extends StatelessWidget {
  const MyFriendItemTwoComponent(
      {super.key,
      required this.widget,
      required this.user,
      required this.isDark,
      required this.size,
      required this.follower,
      required this.userData});

  final Widget? widget;
  final UserModel user;
  final bool isDark;
  final Size size;
  final FollowerCubit follower;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowStatusCubit, bool>(
      builder: (context, isFollowing) {
        return MyFriendItemTwoDetails(
          isFollowing: isFollowing,
          widget: widget,
          user: user,
          isDark: isDark,
          size: size,
          onTap: () async {
            if (isFollowing) {
              await follower.deleteFollower(followerID: user.userID);
            } else {
              follower.addFollower(
                  followerID: user.userID,
                  userName: user.userName,
                  profileImage: user.profileImage,
                  userID: user.userID,
                  emailAddress: user.emailAddress,
                  isFollowing: !isFollowing,
                  meUserName: userData.userName,
                  meProfileImage: userData.profileImage,
                  meEmailAddress: userData.emailAddress);
            }
          },
        );
      },
    );
  }
}
