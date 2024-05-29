import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';

import '../../../cubit/follower/follower_cubit.dart';
import '../../../cubit/get_following/get_following_cubit.dart';
import '../custom_following_trailing_widget.dart';
import '../list_view_list_tile.dart';

class FollowingPageListView extends StatelessWidget {
  const FollowingPageListView(
      {super.key,
      required this.following,
      required this.size,
      required this.follower});

  final GetFollowingCubit following;
  final Size size;
  final FollowerCubit follower;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: following.followingList.length,
        itemBuilder: (context, index) {
          return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
            builder: (context, state) {
              if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
                final data = state.userModel.firstWhere((element) =>
                    element.userID == following.followingList[index].userID);
                return ListViewListTile(
                    friendData: data,
                    size: size,
                    trailingWidget: FollowingCustomTrailingWidget(
                        size: size,
                        user: following.followingList[index],
                        follower: follower));
              } else {
                return Container();
              }
            },
          );
        });
  }
}
