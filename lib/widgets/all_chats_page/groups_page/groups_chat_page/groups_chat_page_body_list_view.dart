import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_custom_message/groups_chat_custom_message_component_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsChatPageBodyListView extends StatelessWidget {
  const GroupsChatPageBodyListView(
      {super.key, required this.scrollController, required this.groupModel});
  final ScrollController scrollController;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var groupChat = context.read<GroupMessageCubit>();
    return BlocConsumer<GroupMessageCubit, GroupMessageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
              reverse: true,
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: groupChat.groupMessageList.length,
              itemBuilder: (context, index) {
                var message =
                    context.read<GroupMessageCubit>().groupMessageList[index];
                if (message.senderID !=
                    FirebaseAuth.instance.currentUser!.uid) {
                  groupChat.updateGroupsChatMessageSeen(
                      groupID: groupModel.groupID,
                      messageID: message.messageID,
                      groupChatUsersIDSeen: [
                        FirebaseAuth.instance.currentUser!.uid
                      ]);
                }
                return GroupsChatCustomMessageComponentBody(
                    groupModel: groupModel, message: message, size: size);
              }),
        );
      },
    );
  }
}
