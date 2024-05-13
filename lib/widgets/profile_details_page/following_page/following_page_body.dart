import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/get_following/get_following_cubit.dart';
import '../../../cubit/get_following/get_following_state.dart';
import 'following_page_body_list_view.dart';
import 'no_following_page_found_widget.dart';

class FollowingPageBody extends StatelessWidget {
  const FollowingPageBody({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var following = context.read<GetFollowingCubit>();

    return BlocBuilder<GetFollowingCubit, GetFollowingState>(
      builder: (context, state) {
        if (state is IsFollowingFoundSuccess ||
            following.followingList.isEmpty) {
          return const NoFollowingPageFoundWidget();
        }

        return FollowingPageBodyListView(following: following, size: size);
      },
    );
  }
}
