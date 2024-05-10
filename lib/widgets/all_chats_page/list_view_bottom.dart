import 'package:sophiee/cubit/chats/chats_cubit.dart';
import 'package:sophiee/cubit/chats/chats_state.dart';
import 'package:sophiee/cubit/delete_messages/delete_chat_message_cubit.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/pages/chats/chat_page.dart';
import 'package:sophiee/widgets/all_chats_page/item_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart' as getnav;

class ListViewBottom extends StatelessWidget {
  const ListViewBottom({super.key});

  @override
  Widget build(BuildContext context) {
    var message = context.read<MessageCubit>();
    var chat = context.read<ChatsCubit>();
    var deleteAllMediaFiles = context.read<DeleteChatMessageCubit>();

    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        if (state is ChatsSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: chat.chatsList.length,
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    context
                        .read<MessageCubit>()
                        .getMessage(receiverID: chat.chatsList[index].userID);
                    getnav.Get.to(() => ChatPage(userID: chat.chatsList[index].userID),
                        transition: getnav.Transition.leftToRight);
                  },
                  child: Slidable(
                    key: ValueKey(index),
                    endActionPane: ActionPane(
                      motion: const BehindMotion(),
                      children: [
                        SlidableAction(
                            icon: Icons.delete,
                            backgroundColor: Colors.red,
                            onPressed: (context) async {
                              debugPrint(chat.chatsList[index].userID);
                              await deleteAllMediaFiles.deleteChatAllMediaFiles(
                                  friendID: chat.chatsList[index].userID);
                              await message.deleteChat(
                                  friendID: chat.chatsList[index].userID);
                            })
                      ],
                    ),
                    child: ItemBottom(user: chat.chatsList[index]),
                  ),
                );
              },
            ),
          );
        } else {
          return SliverToBoxAdapter(child: Container());
        }
      },
    );
  }
}
