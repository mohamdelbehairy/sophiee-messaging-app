import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophiee/cubit/chat_high_lights/chat_high_light_message/chat_high_light_message_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
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
      return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
        builder: (context, userState) {
          if (userState is GetUserDataSuccess &&
              userState.userModel.isNotEmpty) {
            final data = userState.userModel.firstWhere((element) =>
                element.userID == FirebaseAuth.instance.currentUser!.uid);
            return Container(
              decoration: BoxDecoration(
                  image: data.chatbackgroundImage != null
                      ? DecorationImage(
                          image: CachedNetworkImageProvider(
                              data.chatbackgroundImage!),
                          fit: BoxFit.cover)
                      : null),
              child: ListView.builder(
                  itemCount: chatHighLightMessage.hightLightMessageList.length,
                  itemBuilder: (context, index) {
                    return HighLightListViewItem(
                        userData: userData,
                        message:
                            chatHighLightMessage.hightLightMessageList[index],
                        size: size);
                  }),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    });
  }
}
