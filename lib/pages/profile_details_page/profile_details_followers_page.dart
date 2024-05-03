import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_followers/get_followers_state.dart';
import 'package:sophiee/utils/widget/profile_details_no_item_found.dart';
import 'package:sophiee/widgets/profile_details_page/tab_bar_items_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileDetailsFollowersPage extends StatelessWidget {
  const ProfileDetailsFollowersPage({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var followers = context.read<GetFollowersCubit>();
    return BlocBuilder<GetFollowersCubit, GetFollowersState>(
      builder: (context, state) {
        if (state is IsFollowersFoundSuccess) {
          return ProfileDetailsNoItemFound(
              size: size,
              textOne: 'No Followers',
              textTwo:
                  'We didn\'t find any pepole yet \n Please add a new friend');
        }
        if (state is GetFollowersSuccess) {
          return ListView.builder(
            itemCount: followers.followersList.length,
            itemBuilder: (context, index) {
              return TabBarItemsListTile(
                  user: followers.followersList[index], size: size);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
