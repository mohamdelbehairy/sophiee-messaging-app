import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomMessageListView extends StatelessWidget {
  const CustomMessageListView(
      {super.key,
      required this.user,
      required this.message,
      required this.size});

  final UserModel user;
  final MessageModel message;
  final Size size;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return CustomMessage(
        user: user,
        message: message,
        isSeen: message.isSeen,
        bottomLeft: message.senderID == FirebaseAuth.instance.currentUser!.uid
            ? Radius.circular(size.width * .03)
            : const Radius.circular(0),
        bottomRight: message.senderID == FirebaseAuth.instance.currentUser!.uid
            ? const Radius.circular(0)
            : Radius.circular(size.width * .03),
        alignment: message.senderID == FirebaseAuth.instance.currentUser!.uid
            ? Alignment.centerRight
            : Alignment.centerLeft,
        backGroundMessageColor:
            message.senderID == FirebaseAuth.instance.currentUser!.uid
                ? kPrimaryColor
                : isDark ? messageFriendColorDarkMode: messageFriendColorLightMode,
        messageTextColor:
            message.senderID == FirebaseAuth.instance.currentUser!.uid
                ? Colors.white
                : Colors.white70);
  }
}
