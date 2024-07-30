import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/user_date/image/get_image/get_image_cubit.dart';

import '../../../constants.dart';
import '../../../cubit/get_followers/get_followers_cubit.dart';
import '../../../cubit/get_following/get_following_cubit.dart';
import '../../../cubit/get_friends/get_friends_cubit.dart';
import '../../../utils/methods/initial_state.dart';

AppBar showNotificationAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: kPrimaryColor,
    title: const Text('Notifications',
        style: TextStyle(
            fontWeight: FontWeight.normal, color: Colors.white, fontSize: 26)),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
        InitialState.initFriendState(context);

        context
            .read<GetFollowersCubit>()
            .getFollowers(userID: FirebaseAuth.instance.currentUser!.uid);
        context
            .read<GetFollowingCubit>()
            .getFollowing(userID: FirebaseAuth.instance.currentUser!.uid);
        context
            .read<GetFriendsCubit>()
            .getFriends(userID: FirebaseAuth.instance.currentUser!.uid);

        context
            .read<GetImageCubit>()
            .getImage(userID: FirebaseAuth.instance.currentUser!.uid);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
  );
}
