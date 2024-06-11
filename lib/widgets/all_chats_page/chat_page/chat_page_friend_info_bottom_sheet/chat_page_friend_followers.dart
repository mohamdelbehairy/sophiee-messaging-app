import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/get_followers/get_followers_cubit.dart';
import '../../../../cubit/get_followers/get_followers_state.dart';
import 'chat_page_friend_details.dart';

class ChatPageFriendFollowers extends StatelessWidget {
  const ChatPageFriendFollowers({super.key});

  @override
  Widget build(BuildContext context) {
    var follower = context.read<GetFollowersCubit>();
    return BlocBuilder<GetFollowersCubit, GetFollowersState>(
      builder: (context, state) {
        return ChatPageFriendDetails(
            textNumber: '${follower.followersList.length}',
            textType: 'Followers');
      },
    );
  }
}