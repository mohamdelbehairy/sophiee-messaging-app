import 'package:flutter/material.dart';

import 'chat_page_friend_followers.dart';
import 'chat_page_friend_following.dart';
import 'chat_page_friend_posts.dart';

class ChatPageFriendInfo extends StatelessWidget {
  const ChatPageFriendInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ChatPageFriendPosts(),
        ChatPageFriendFollowers(),
        ChatPageFriendFollowing(),
      ],
    );
  }
}