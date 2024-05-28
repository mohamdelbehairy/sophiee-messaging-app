import 'package:sophiee/cubit/chats/chats_cubit.dart';
import 'package:sophiee/cubit/chats/chats_state.dart';
import 'package:sophiee/cubit/delete_messages/delete_chat_message_cubit.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chats_founded.dart';
import 'no_chats_founded.dart';

class ListViewBottom extends StatelessWidget {
  const ListViewBottom({super.key, required this.size, required this.isDark});
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    var message = context.read<MessageCubit>();
    var chat = context.read<ChatsCubit>();
    var deleteAllMediaFiles = context.read<DeleteChatMessageCubit>();

    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        if (state is ChatsSuccess) {
          if (chat.chatsList.isNotEmpty) {
            return ChatsFounded(
                chat: chat,
                deleteAllMediaFiles: deleteAllMediaFiles,
                message: message);
          }
          return SliverToBoxAdapter(
              child: NoChatsFounded(size: size, isDark: isDark));
        } else {
          return SliverToBoxAdapter(child: Container());
        }
      },
    );
  }
}


