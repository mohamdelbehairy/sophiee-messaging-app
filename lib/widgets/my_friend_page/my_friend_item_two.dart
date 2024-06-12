import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/follow_status/follow_status_cubit.dart';
import 'package:sophiee/cubit/follower/follower_cubit.dart';
import 'package:sophiee/cubit/follower/follower_state.dart';
import 'package:sophiee/cubit/friends/friends_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/initial_state.dart';
import 'my_friend_item_two_body.dart';

class MyFriendItemTwo extends StatefulWidget {
  const MyFriendItemTwo({super.key, required this.user, this.widget});
  final UserModel user;
  final Widget? widget;

  @override
  State<MyFriendItemTwo> createState() => _MyFriendItemTwoState();
}

class _MyFriendItemTwoState extends State<MyFriendItemTwo> {
  void initialFriends() {
    InitialState.initFriendState(context);
  }

  @override
  void initState() {
    context
        .read<FollowStatusCubit>()
        .checkFollowStatus(followerID: widget.user.userID);
    super.initState();
  }

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
          return BlocConsumer<FollowerCubit, FollowerState>(
            listener: (context, state) async {
              if (state is AddFollowerSuccess) {
                if (state.isFollowing &&
                    await follower.followerResult(
                        followerID: widget.user.userID)) {
                  friend.setFriends(
                      friendID: widget.user.userID,
                      userName: widget.user.userName,
                      profileImage: widget.user.profileImage,
                      userID: widget.user.userID,
                      emailAddress: widget.user.emailAddress,
                      meUserName: userData.userName,
                      meProfileImage: userData.profileImage,
                      meEmailAddress: userData.emailAddress);
                }
              }
              if (state is DeleteFollowerSuccess) {
                if (!state.isFollowing ||
                    !await follower.followerResult(
                        followerID: widget.user.userID)) {
                  await friend.deleteFriends(friendID: widget.user.userID);

                  debugPrint('تم حذف الصداقه');
                }
              }
            },
            builder: (context, state) {
              return BlocBuilder<FollowStatusCubit, bool>(
                builder: (context, isFollowing) {
                  return MyFriendItemTwoBody(
                    isFollowing: isFollowing,
                    widget: widget,
                    isDark: isDark,
                    size: size,
                    onTap: () async {
                      if (isFollowing) {
                        await follower.deleteFollower(
                            followerID: widget.user.userID);
                        initialFriends();
                      } else {
                        follower.addFollower(
                            followerID: widget.user.userID,
                            userName: widget.user.userName,
                            profileImage: widget.user.profileImage,
                            userID: widget.user.userID,
                            emailAddress: widget.user.emailAddress,
                            isFollowing: !isFollowing,
                            meUserName: userData.userName,
                            meProfileImage: userData.profileImage,
                            meEmailAddress: userData.emailAddress);
                        initialFriends();
                      }
                    },
                  );
                },
              );
            },
          );
        } else {
          return Container();
        }
      } else {
        return Container();
      }
    });
  }
}
