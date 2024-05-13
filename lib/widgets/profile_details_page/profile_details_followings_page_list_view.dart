import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';

import '../../cubit/get_following/get_following_cubit.dart';
import 'profile_details_list_tile_trailing_button.dart';
import 'tab_bar_items_list_view.dart';

class ProfileDetailsFollowingsPageListView extends StatelessWidget {
  const ProfileDetailsFollowingsPageListView(
      {super.key, required this.following, required this.size});

  final GetFollowingCubit following;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: following.followingList.length,
        itemBuilder: (context, index) {
          return TabBarItemsListTile(
              user: following.followingList[index],
              size: size,
              trailingWidget: ProfileDetailsListTileTrailingButton(
                borderColor: kPrimaryColor,
                buttonNameColor: kPrimaryColor,
                buttonColor: Colors.white,
                  size: size, onTap: () {}, buttonName: 'Follow Back'));
        });
  }
}
