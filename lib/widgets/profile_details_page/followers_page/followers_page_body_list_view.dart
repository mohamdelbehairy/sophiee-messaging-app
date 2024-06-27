import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';

import '../../../../cubit/get_followers/get_followers_cubit.dart';
import '../list_view_list_tile.dart';

class FollowersPageBodyListView extends StatelessWidget {
  const FollowersPageBodyListView(
      {super.key, required this.followers, required this.size});

  final GetFollowersCubit followers;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: followers.followersList.length,
      itemBuilder: (context, index) {
        return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
          builder: (context, state) {
            if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
              final data = state.userModel.firstWhere((element) =>
                  element.userID == followers.followersList[index].userID);
              return ListViewListTile(friendData: data, size: size);
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
