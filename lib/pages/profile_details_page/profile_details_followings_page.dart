import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_state.dart';
import 'package:sophiee/utils/widget/profile_details_no_item_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/profile_details_page/profile_details_followings_page_list_view.dart';

class ProfileDetailsFollowingsPage extends StatelessWidget {
  const ProfileDetailsFollowingsPage({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var following = context.read<GetFollowingCubit>();
    return BlocBuilder<GetFollowingCubit, GetFollowingState>(
      builder: (context, state) {
        if (state is IsFollowingFoundSuccess) {
          return ProfileDetailsNoItemFound(
              size: size,
              textOne: 'No Followings',
              textTwo:
                  'We didn\'t find any people yet \n Please add a new friend');
        }
        if (state is GetFollowingSuccess) {
          return ProfileDetailsFollowingsPageListView(
              following: following, size: size);
        } else {
          return Container();
        }
      },
    );
  }
}
