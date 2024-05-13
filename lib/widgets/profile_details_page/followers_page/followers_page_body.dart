import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_followers/get_followers_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/widgets/profile_details_page/followers_page/no_followers_page_body.dart';
import 'followers_page_body_list_view.dart';

class FolowersPageBody extends StatelessWidget {
  const FolowersPageBody({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var followers = context.read<GetFollowersCubit>();
    return BlocBuilder<GetFollowersCubit, GetFollowersState>(
      builder: (context, state) {
        if (state is IsFollowersFoundSuccess ||
            followers.followersList.isEmpty) {
          return const NoFollowersPageFoundWidget();
        }
        if (state is GetFollowersSuccess) {
          return FollowersPageBodyListView(followers: followers, size: size);
        } else {
          return Container();
        }
      },
    );
  }
}
