import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_followers/get_followers_state.dart';
import 'package:sophiee/pages/profile_details_page/followers_page.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/navigation.dart';

import 'custom_profile_info.dart';

class ProfilePageCardOneFollowers extends StatelessWidget {
  const ProfilePageCardOneFollowers(
      {super.key,
      required this.user,
      required this.follower,
      required this.size});

  final UserModel user;
  final GetFollowersCubit follower;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigation.push(context, FollowersPage(size: size)),
      child: BlocBuilder<GetFollowersCubit, GetFollowersState>(
        builder: (context, state) {
          if (state is GetFollowersSuccess) {
            return CustomProfileInfo(
                numberInfo: '${follower.followersList.length}',
                textInfo: 'Followers');
          } else {
            return const CustomProfileInfo(
                numberInfo: '0', textInfo: 'Followers');
          }
        },
      ),
    );
  }
}
