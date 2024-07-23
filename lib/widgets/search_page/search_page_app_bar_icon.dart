import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/get_followers/get_followers_cubit.dart';
import '../../cubit/get_following/get_following_cubit.dart';

class SearchPageAppBarIcon extends StatelessWidget {
  const SearchPageAppBarIcon({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      top: size.height * .04,
      child: IconButton(
        color: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          context
              .read<GetFollowingCubit>()
              .getFollowing(userID: FirebaseAuth.instance.currentUser!.uid);
          context
              .read<GetFollowersCubit>()
              .getFollowers(userID: FirebaseAuth.instance.currentUser!.uid);
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: size.height * .035,
        ),
      ),
    );
  }
}
