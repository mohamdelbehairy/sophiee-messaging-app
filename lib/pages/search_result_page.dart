import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/search_result/search_result_page_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // context
    //     .read<FollowStatusCubit>()
    //     .checkFollowStatus(followerID: user.userID);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        titleSpacing: size.width * -.02,
        leading: GestureDetector(
            onTap: () {
              context.read<GetFollowersCubit>().followersList.clear();
              context.read<GetFollowingCubit>().followingList.clear();
              context
                  .read<GetFriendsCubit>()
                  .getFriends(userID: FirebaseAuth.instance.currentUser!.uid);
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text('Search Page',
            style: TextStyle(
                fontSize: size.height * .028, fontWeight: FontWeight.bold)),
      ),
      body: SearchResultBogy(user: user),
    );
  }
}
