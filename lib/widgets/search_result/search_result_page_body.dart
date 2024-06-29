import 'package:sophiee/cubit/follower/follower_cubit.dart';
import 'package:sophiee/cubit/follower/follower_state.dart';
import 'package:sophiee/cubit/friends/friends_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/widgets/search_result/search_result_page_component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/is_friend/is_friend_cubit.dart';

class SearchResultBogy extends StatelessWidget {
  const SearchResultBogy({super.key, required this.userID});
  final String userID;

  @override
  Widget build(BuildContext context) {
    var follower = context.read<FollowerCubit>();
    var friend = context.read<FriendsCubit>();
    var isFriend = context.read<IsFriendCubit>();

    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, userState) {
        if (userState is GetUserDataSuccess && userState.userModel.isNotEmpty) {
          final currentUser = FirebaseAuth.instance.currentUser;

          if (currentUser != null) {
            final userData = userState.userModel
                .firstWhere((element) => element.userID == currentUser.uid);
            final user = userState.userModel
                .firstWhere((element) => element.userID == userID);
            return BlocListener<FollowerCubit, FollowerState>(
                listener: (context, state) async {
                  if (state is AddFollowerSuccess) {
                    if (state.isFollowing == true) {}
                    if (state.isFollowing &&
                        await follower.followerResult(
                            followerID: user.userID)) {
                      friend.setFriends(
                          friendID: user.userID,
                          userName: user.userName,
                          profileImage: user.profileImage,
                          userID: user.userID,
                          emailAddress: user.emailAddress,
                          meUserName: userData.userName,
                          meProfileImage: userData.profileImage,
                          meEmailAddress: userData.emailAddress);
                      isFriend.isFriend();
                    }
                  }
                  if (state is DeleteFollowerSuccess) {
                    if (!state.isFollowing ||
                        !await follower.followerResult(
                            followerID: user.userID)) {
                      await friend.deleteFriends(friendID: user.userID);
                      isFriend.isFriend();
                      debugPrint('تم حذف الصداقه');
                    }
                  }
                },
                child:
                    SearchResultPageComponent(user: user, userData: userData));
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }
}
