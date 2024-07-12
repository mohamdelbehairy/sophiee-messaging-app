import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/get_followers/get_followers_cubit.dart';
import '../../cubit/get_following/get_following_cubit.dart';
import '../../cubit/get_friends/get_friends_cubit.dart';
import '../../models/my_friend_icon_model.dart';
import '../../models/users_model.dart';
import '../../utils/widget/custom_user_image.dart';
import '../my_friend_page/my_friend_page_icon.dart';
import '../my_friend_page/my_friend_page_icon_elispes.dart';

class SearchResultItemOne extends StatelessWidget {
  const SearchResultItemOne(
      {super.key,
      required this.user,
      required this.size,
      required this.isFriend,
      required this.userData});

  final UserModel user, userData;
  final Size size;
  final bool isFriend;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomUserImage(user: user, size: size, userData: userData),
        MyFriendPageIconElispes(
            user: user, size: size, isFriend: isFriend),
        MyFriendPageIcon(
            myFriendIconModel: MyFriendIconModel(
                left: 8,
                size: size.height * .035,
                icon: Icons.arrow_back,
                onPressed: () {
                  context.read<GetFollowersCubit>().followersList.clear();
                  context.read<GetFollowingCubit>().followingList.clear();
                  context.read<GetFriendsCubit>().getFriends(
                      userID: FirebaseAuth.instance.currentUser!.uid);
                  Navigator.pop(context);
                })),
      ],
    );
  }
}
