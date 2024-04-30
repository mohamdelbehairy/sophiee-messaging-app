import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/chats/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class MyFriendsBottomMessage extends StatelessWidget {
  const MyFriendsBottomMessage({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        context.read<MessageCubit>().getMessage(receiverID: user.userID);
        getnav.Get.to(() => ChatPage(user: user),
            transition: getnav.Transition.leftToRight);
      },
      child: Container(
        height: size.height * .045,
        width: size.width * .2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height * .04),
          color: kPrimaryColor,
          border: Border.all(color: Colors.transparent),
        ),
        child: const Center(
          child: Text(
            'Message',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
