import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';

import '../../constants.dart';
import '../../cubit/get_following/get_following_cubit.dart';
import '../../cubit/get_friends/get_friends_cubit.dart';
import '../../widgets/profile_details_page/following_page/following_page_body.dart';

class FollowingPage extends StatelessWidget {
  const FollowingPage({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            titleSpacing: size.width * -.02,
            backgroundColor: kPrimaryColor,
            title: const Text('Following',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22)),
            leading: GestureDetector(
                onTap: () {
                  context.read<GetFollowingCubit>().getFollowing(
                      userID: FirebaseAuth.instance.currentUser!.uid);
                  context.read<GetFollowersCubit>().getFollowers(
                      userID: FirebaseAuth.instance.currentUser!.uid);
                  context.read<GetFriendsCubit>().getFriends(
                      userID: FirebaseAuth.instance.currentUser!.uid);
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back))),
        body: FollowingPageBody(size: size));
  }
}
