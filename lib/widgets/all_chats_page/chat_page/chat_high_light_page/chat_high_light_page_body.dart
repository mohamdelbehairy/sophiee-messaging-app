import 'package:sophiee/cubit/chat_high_lights/chat_high_light_message/chat_high_light_message_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/high_light_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatHighLightPageBody extends StatelessWidget {
  const ChatHighLightPageBody(
      {super.key,
      required this.chatHighLightMessage,
      required this.size,
      required this.userData});
  final ChatHighLightMessageCubit chatHighLightMessage;
  final Size size;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatHighLightMessageCubit, ChatHighLightMessageState>(
        builder: (context, state) {
      return ListView.builder(
          itemCount: chatHighLightMessage.hightLightMessageList.length,
          itemBuilder: (context, index) {
            return HighLightListViewItem(
                userData: userData,
                message: chatHighLightMessage.hightLightMessageList[index],
                size: size);
          });
    });
  }
}
