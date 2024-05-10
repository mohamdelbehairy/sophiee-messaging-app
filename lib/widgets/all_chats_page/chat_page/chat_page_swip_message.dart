import 'package:flutter/material.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_list_view.dart';
import 'package:swipe_to/swipe_to.dart';

class ChatPageSwipMessage extends StatelessWidget {
  const ChatPageSwipMessage(
      {super.key,
      required this.message,
      required this.size,
      required this.user,
      this.onLeftSwipe});

  final MessageModel message;
  final Size size;
  final UserModel user;
  final void Function(DragUpdateDetails)? onLeftSwipe;

  @override
  Widget build(BuildContext context) {
    return SwipeTo(
        onLeftSwipe: onLeftSwipe,
        key: Key(message.messageID),
        child: CustomMessageListView(user: user, message: message, size: size));
  }
}
