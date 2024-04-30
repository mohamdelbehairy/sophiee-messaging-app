import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/chat_high_lights/chat_high_light_message/chat_high_light_message_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/high_light_app_bar_action_icon.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/high_light_app_bar_text.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/no_high_light_messages.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_high_light_page/chat_high_light_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatHighLightPage extends StatelessWidget {
  const ChatHighLightPage({super.key, required this.size, required this.user});
  final Size size;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    var hightLightChatMessage = context.read<ChatHighLightMessageCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: HighLightPageAppBarText(size: size),
        actions: [
          HighLightAppBarActionIcon(
              size: size,
              chatHighLightMessage: hightLightChatMessage,
              user: user)
        ],
      ),
      body: BlocBuilder<ChatHighLightMessageCubit, ChatHighLightMessageState>(
          builder: (context, state) {
        return SafeArea(
            child: hightLightChatMessage.hightLightMessageList.isEmpty
                ? NoHighLighMessages(size: size)
                : ChatHighLightPageBody(
                    userData: user,
                    chatHighLightMessage: hightLightChatMessage,
                    size: size));
      }),
    );
  }
}
