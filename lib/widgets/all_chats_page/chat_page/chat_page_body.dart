import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_body_details.dart';
import 'package:flutter/material.dart';

class ChatPageBody extends StatelessWidget {
  const ChatPageBody({super.key, required this.user, required this.size});

  final UserModel user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ChatPageBodyDetails(user: user, size: size);
  }
}
