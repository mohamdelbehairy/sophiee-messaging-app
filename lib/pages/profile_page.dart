import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophiee/cubit/all_chats_shimmer_status/all_chats_shimmer_status.dart';
import 'package:sophiee/cubit/connectivity/connectivity_cubit.dart';
import 'package:sophiee/cubit/user_date/image/get_image/get_image_cubit.dart';
import 'package:sophiee/utils/shimmer/home/profile/profile_page_shimmer.dart';
import 'package:sophiee/widgets/profile_page/profile_page_body.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_followers/get_followers_cubit.dart';
import '../cubit/get_following/get_following_cubit.dart';
import '../cubit/get_friends/get_friends_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context
        .read<GetImageCubit>()
        .getImage(userID: FirebaseAuth.instance.currentUser!.uid);
    context.read<GetFriendsCubit>().isFriendFound();
    context.read<GetFollowingCubit>().isFollowingFound();
    context.read<GetFollowersCubit>().isFollowersFound();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<AllChatsShimmerStatusCubit, bool>(
        builder: (context, isLoading) {
          return BlocBuilder<ConnectivityCubit, ConnectivityResult>(
            builder: (context, state) {
              if (state == ConnectivityResult.wifi ||
                  state == ConnectivityResult.mobile) {
                return isLoading
                    ? const ProfilePageShimmer()
                    : ProfilePageBody(size: size);
              } else {
                return const ProfilePageShimmer();
              }
            },
          );
        },
      ),
    );
  }
}
