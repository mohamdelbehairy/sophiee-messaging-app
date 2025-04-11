import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../../../constants.dart';
import '../../../../cubit/chat_high_lights/chat_high_light_message/chat_high_light_message_cubit.dart';
import '../../../../models/users_model.dart';
import '../../../../pages/chats/chat_high_light_page.dart';
import 'chat_page_friend_info_connection.dart';

class HighlightsBottomSheet extends StatelessWidget {
  const HighlightsBottomSheet(
      {super.key,
      required this.user,
      required this.size,
      required this.isDark});

  final UserModel user;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return ChatPageFriendInfoConnection(
        text: 'Highlights',
        iconColor: kPrimaryColor,
        icon: Icons.star,
        onTap: () {
          context
              .read<ChatHighLightMessageCubit>()
              .getHightLightMessage(friendID: user.userID);
          Navigation.push(context,
              ChatHighLightPage(size: size, user: user, isDark: isDark));
        });
  }
}
