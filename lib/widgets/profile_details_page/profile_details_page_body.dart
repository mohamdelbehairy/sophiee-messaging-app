import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/profile_details_page/profile_details_app_bar_preferred_size.dart';
import 'package:sophiee/widgets/profile_details_page/profile_details_page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/widgets/profile_details_page/profile_details_page_body_component.dart';

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
  void initState() {
    context.read<GetFriendsCubit>().isFriendFound();
    context.read<GetFollowingCubit>().isFollowingFound();
    context.read<GetFollowersCubit>().isFollowersFound();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: widget.index,
        child: Scaffold(
            appBar: AppBar(
              titleSpacing: widget.size.width * -.02,
              backgroundColor: kPrimaryColor,
              title: ProfileDetailsPageAppBar(
                  user: widget.user, size: widget.size),
              bottom: profileDetailsAppBarPreferredSize(
                  size: widget.size,
                  titleIndex: titleIndex,
                  index: widget.index,
                  onTap: (index) {
                    setState(() {
                      titleIndex = index;
                    });
                    widget.index = index;
                  }),
            ),
            body: SafeArea(
                child: ProfileDetailsPageBodyComponent(size: widget.size))));
  }
}
