import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/follower/follower_cubit.dart';
import '../../cubit/follower/follower_state.dart';
import '../../cubit/friends/friends_cubit.dart';
import '../../models/users_model.dart';
import '../../utils/initial_state.dart';
import 'my_friend_component.dart';

class MyFriendItemTwoBody extends StatelessWidget {
  const MyFriendItemTwoBody(
      {super.key,
      required this.follower,
      required this.user,
      required this.friend,
      required this.userData,
      required this.isDark,
      required this.size,
      required this.widget});

  final FollowerCubit follower;

  final FriendsCubit friend;
  final UserModel userData, user;
  final bool isDark;
  final Size size;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FollowerCubit, FollowerState>(
      listener: (context, state) async {
        if (state is AddFollowerSuccess) {
          if (state.isFollowing &&
              await follower.followerResult(followerID: user.userID)) {
            friend.setFriends(
                friendID: user.userID,
                userName: user.userName,
                profileImage: user.profileImage,
                userID: user.userID,
                emailAddress: user.emailAddress,
                meUserName: userData.userName,
                meProfileImage: userData.profileImage,
                meEmailAddress: userData.emailAddress);
            // ignore: use_build_context_synchronously
            InitialState.initFriendState(context);
          }
        }
        if (state is DeleteFollowerSuccess) {
          if (!state.isFollowing ||
              !await follower.followerResult(followerID: user.userID)) {
            await friend.deleteFriends(friendID: user.userID);
            // ignore: use_build_context_synchronously
            InitialState.initFriendState(context);
            debugPrint('تم حذف الصداقه');
          }
        }
      },
      builder: (context, state) {
        return MyFriendItemTwoComponent(
            widget: widget,
            user: user,
            isDark: isDark,
            size: size,
            follower: follower,
            userData: userData);
      },
    );
  }
}
