import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../cubit/chat_high_lights/chat_high_light_message/chat_high_light_message_cubit.dart';
import '../../cubit/chats/chats_cubit.dart';
import '../../cubit/delete_messages/delete_chat_message_cubit.dart';
import '../../cubit/message/message_cubit.dart';
import '../../cubit/update_user_data/update_user_cubit_cubit.dart';
import '../../cubit/user_date/get_user_data/get_user_data_cubit.dart';
import '../../cubit/user_date/get_user_data/get_user_data_state.dart';
import '../../pages/chats/chat_page.dart';
import 'custom_slidable_action_item.dart';
import 'item_bottom/item_bottom.dart';

class ChatsFounded extends StatelessWidget {
  const ChatsFounded(
      {super.key,
      required this.chat,
      required this.deleteAllMediaFiles,
      required this.message});

  final ChatsCubit chat;
  final DeleteChatMessageCubit deleteAllMediaFiles;
  final MessageCubit message;

  @override
  Widget build(BuildContext context) {
    var muteAndunMute = context.read<UpdateUserDataCubit>();
    var deleteHighLight = context.read<ChatHighLightMessageCubit>();
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final userData = state.userModel.firstWhere((element) =>
              element.userID == FirebaseAuth.instance.currentUser!.uid);
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: chat.chatsList.length,
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    context
                        .read<MessageCubit>()
                        .getMessage(receiverID: chat.chatsList[index].userID);
                    Navigation.push(context,
                        ChatPage(userID: chat.chatsList[index].userID));
                  },
                  child: Slidable(
                    key: ValueKey(index),
                    endActionPane: ActionPane(
                      motion: const BehindMotion(),
                      children: [
                        CustomSlidableActionItem(onPressed: (context) async {
                          await deleteAllMediaFiles.deleteChatAllMediaFiles(
                              friendID: chat.chatsList[index].userID);

                          await deleteHighLight.removeAllHighLightMessages(
                              friendID: chat.chatsList[index].userID);
                          await message.deleteChat(
                              friendID: chat.chatsList[index].userID);
                        }),
                        if (userData.isChatNotify)
                          CustomSlidableActionItem(
                              lable: userData.muteUsers
                                      .contains(chat.chatsList[index].userID)
                                  ? 'unmute'
                                  : 'mute',
                              icon: userData.muteUsers
                                      .contains(chat.chatsList[index].userID)
                                  ? Icons.volume_up
                                  : Icons.volume_off,
                              iconColor: Colors.blue,
                              onPressed: (context) async {
                                if (userData.muteUsers
                                    .contains(chat.chatsList[index].userID)) {
                                  await muteAndunMute.removeListUsers(
                                      fieldName: 'muteUsers',
                                      userID: chat.chatsList[index].userID);
                                } else {
                                  await muteAndunMute.addListUsers(
                                      fieldName: 'muteUsers',
                                      userID: chat.chatsList[index].userID);
                                }
                              }),
                      ],
                    ),
                    child: ItemBottom(
                        user: chat.chatsList[index],
                        isMute: userData.muteUsers
                            .contains(chat.chatsList[index].userID)),
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
