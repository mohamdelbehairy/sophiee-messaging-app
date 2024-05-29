import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../cubit/follower/follower_cubit.dart';
import '../../cubit/friends/friends_cubit.dart';
import '../../cubit/get_following/get_following_cubit.dart';
import '../../cubit/get_following/get_following_state.dart';
import '../../models/users_model.dart';
import 'profile_details_list_tile_trailing_button.dart';

class FollowingCustomTrailingWidget extends StatelessWidget {
  const FollowingCustomTrailingWidget(
      {super.key,
      required this.size,
      required this.user,
      required this.follower});

  final Size size;
  final UserModel user;
  final FollowerCubit follower;

  @override
  Widget build(BuildContext context) {
    final friend = context.read<FriendsCubit>();
    return BlocBuilder<GetFollowingCubit, GetFollowingState>(
      builder: (context, state) {
        return ProfileDetailsListTileTrailingButton(
            borderColor: Colors.transparent,
            buttonNameColor: Colors.white,
            buttonColor: kPrimaryColor,
            size: size,
            onTap: () async {
              debugPrint('is following: ${user.isFollowing}');
              if (user.isFollowing!) {
                await follower.deleteFollower(followerID: user.userID);
                await friend.deleteFriends(friendID: user.userID);
              }
            },
            buttonName: 'Remove');
      },
    );
  }
}
