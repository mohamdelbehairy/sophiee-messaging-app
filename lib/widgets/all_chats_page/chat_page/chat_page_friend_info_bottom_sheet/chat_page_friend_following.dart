import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/get_following/get_following_cubit.dart';
import '../../../../cubit/get_following/get_following_state.dart';
import 'chat_page_friend_details.dart';

class ChatPageFriendFollowing extends StatelessWidget {
  const ChatPageFriendFollowing({super.key});

  @override
  Widget build(BuildContext context) {
    var following = context.read<GetFollowingCubit>();
    return BlocBuilder<GetFollowingCubit, GetFollowingState>(
        builder: (context, state) {
      return ChatPageFriendDetails(
          textNumber: '${following.followingList.length}',
          textType: 'Following');
    });
  }
}