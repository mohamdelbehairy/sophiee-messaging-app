import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/message/message_cubit.dart';
import '../../../cubit/message/message_state.dart';
import '../../../models/users_model.dart';

class ChatPageAppBarFriendNameAndStatus extends StatelessWidget {
  const ChatPageAppBarFriendNameAndStatus(
      {super.key,
      required this.userData,
      required this.user,
      required this.size,
      required this.data,
      required this.text});

  final UserModel userData, user, data;
  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: userData.blockUsers.contains(user.userID) ||
                    user.blockUsers.contains(userData.userID)
                ? size.width * .5
                : size.width * .35,
            child: Text(data.userName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: size.width * .04))),
        const SizedBox(height: 2),
        BlocBuilder<MessageCubit, MessageState>(
          builder: (context, state) {
            if (state is TypingSuccess) {
              return Text(
                state.isTyping ? 'type...' : text,
                style: TextStyle(
                    fontSize: state.isTyping
                        ? size.width * .025
                        : !user.isLastSeendAndOnline
                            ? size.width * .022
                            : size.width * .022),
              );
            } else {
              return Text(text, style: TextStyle(fontSize: size.width * .02));
            }
          },
        ),
      ],
    );
  }
}
