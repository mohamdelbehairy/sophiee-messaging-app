import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/follower/follower_state.dart';

import '../../../../cubit/follower/follower_cubit.dart';
import '../../../../cubit/get_followers/get_followers_cubit.dart';
import '../../../../cubit/get_following/get_following_cubit.dart';
import '../../../../cubit/get_friends/get_friends_cubit.dart';
import '../custom_following_trailing_widget.dart';
import '../list_view_list_tile.dart';

class FollowingPageBodyListView extends StatelessWidget {
  const FollowingPageBodyListView(
      {super.key, required this.following, required this.size});

  final GetFollowingCubit following;
  final Size size;

  @override
  Widget build(BuildContext context) {
    var follower = context.read<FollowerCubit>();
    return BlocListener<FollowerCubit, FollowerState>(
      listener: (context, state) {
        if (state is DeleteFollowerSuccess) {
          context
              .read<GetFriendsCubit>()
              .getFriends(userID: FirebaseAuth.instance.currentUser!.uid);
          context
              .read<GetFollowersCubit>()
              .getFollowers(userID: FirebaseAuth.instance.currentUser!.uid);
          context
              .read<GetFollowingCubit>()
              .getFollowing(userID: FirebaseAuth.instance.currentUser!.uid);
        }
      },
      child: ListView.builder(
          itemCount: following.followingList.length,
          itemBuilder: (context, index) {
            return ListViewListTile(
                user: following.followingList[index],
                size: size,
                trailingWidget: FollowingCustomTrailingWidget(
                    size: size,
                    user: following.followingList[index],
                    follower: follower));
          }),
    );
  }
}
