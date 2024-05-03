import 'package:flutter/material.dart';
import 'package:sophiee/pages/profile_details_page/profile_details_followers_page.dart';
import 'package:sophiee/pages/profile_details_page/profile_details_followings_page.dart';
import 'package:sophiee/pages/profile_details_page/profile_details_friends_page.dart';

class ProfileDetailsPageBodyComponent extends StatelessWidget {
  const ProfileDetailsPageBodyComponent({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: TabBarView(children: [
          ProfileDetailsFollowersPage(size: size),
          ProfileDetailsFollowingsPage(size: size),
          ProfileDetailsFriendsPage(size: size)
        ]))
      ],
    );
  }
}
