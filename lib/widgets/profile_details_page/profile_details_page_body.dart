import 'package:sophiee/constants.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/profile_details_page/profile_details_followers_page.dart';
import 'package:sophiee/pages/profile_details_page/profile_details_followings_page.dart';
import 'package:sophiee/pages/profile_details_page/profile_details_friends_page.dart';
import 'package:sophiee/utils/widget/custom_tab_bar_item.dart';
import 'package:sophiee/widgets/profile_details_page/profile_details_page_app_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileDetailsPageBody extends StatefulWidget {
  ProfileDetailsPageBody(
      {super.key, required this.size, required this.user, required this.index});

  final Size size;
  final UserModel user;
  int index;

  @override
  State<ProfileDetailsPageBody> createState() => _ProfileDetailsPageBodyState();
}

class _ProfileDetailsPageBodyState extends State<ProfileDetailsPageBody> {
  int titleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: widget.index,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: widget.size.width * -.02,
          backgroundColor: kPrimaryColor,
          title: ProfileDetailsPageAppBar(user: widget.user, size: widget.size),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Expanded(
              child: TabBar(
                indicatorColor: Colors.white,
                indicatorPadding:
                    EdgeInsets.symmetric(horizontal: widget.size.width * 0.02),
                onTap: (index) {
                  setState(() {
                    titleIndex = index;
                  });
                  widget.index = index;
                },
                tabs: [
                  CustomTabBarItem(
                      
                      size: widget.size,
                      tabBarText: 'Followers',
                      tabBarColor:
                          widget.index == 0 ? Colors.white : Colors.white60,
                      tabBarTextSize: widget.index == 0
                          ? widget.size.width * .035
                          : widget.size.width * .03),
                  CustomTabBarItem(
                 
                      size: widget.size,
                      tabBarText: 'Follower',
                      tabBarColor:
                          widget.index == 1 ? Colors.white : Colors.white60,
                      tabBarTextSize: widget.index == 1
                          ? widget.size.width * .035
                          : widget.size.width * .03),
                  CustomTabBarItem(
                   
                    size: widget.size,
                    tabBarText: 'Friends',
                    tabBarColor:
                        titleIndex == 2 ? Colors.white : Colors.white60,
                    tabBarTextSize: titleIndex == 2
                        ? widget.size.width * .035
                        : widget.size.width * .03,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
                child: TabBarView(children: [
              ProfileDetailsFollowersPage(size: widget.size),
              ProfileDetailsFollowingsPage(size: widget.size),
              ProfileDetailsFriendsPage(size: widget.size)
            ]))
          ],
        )),
      ),
    );
  }
}
