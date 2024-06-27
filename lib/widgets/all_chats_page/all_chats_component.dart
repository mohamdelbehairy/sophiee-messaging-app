import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../cubit/chats/chats_cubit.dart';
import '../../cubit/chats/chats_state.dart';
import '../../cubit/get_friends/get_friends_cubit.dart';
import '../../cubit/get_friends/get_friends_state.dart';
import 'list_view_bottom.dart';
import 'item_top/list_view_top.dart';
import 'no_chats_founded.dart';

class AllChatsComponent extends StatelessWidget {
  const AllChatsComponent(
      {super.key,
      required this.friends,
      required this.chat,
      required this.size,
      required this.isDark});

  final GetFriendsCubit friends;
  final ChatsCubit chat;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, chatsState) {
        return BlocBuilder<GetFriendsCubit, GetFriendsState>(
          builder: (context, friendState) {
            if (chatsState is ChatsSuccess ||
                friendState is GetFriendsSuccess) {
              if (friends.friends.isEmpty && chat.chatsList.isEmpty) {
                return Center(
                  child: NoChatsFounded(
                      image: emptyImageUrl, size: size, isDark: isDark),
                );
              }
            }
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: ListViewTop()),
                ListViewBottom(isDark: isDark, size: size),
              ],
            );
          },
        );
      },
    );
  }
}
