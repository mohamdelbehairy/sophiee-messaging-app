import 'package:flutter/material.dart';

import '../../../../cubit/get_followers/get_followers_cubit.dart';
import '../list_view_list_tile.dart';

class FollowersPageBodyListView extends StatelessWidget {
  const FollowersPageBodyListView(
      {super.key, required this.followers, required this.size});

  final GetFollowersCubit followers;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: followers.followersList.length,
      itemBuilder: (context, index) {
        return ListViewListTile(
            user: followers.followersList[index], size: size);
      },
    );
  }
}
