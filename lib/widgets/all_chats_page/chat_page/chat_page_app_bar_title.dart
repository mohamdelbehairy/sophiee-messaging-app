import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/cubit/message/message_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_friend_info_bottom_sheet/chat_page_friend_info_bottom_sheet.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPageAppBarTitle extends StatelessWidget {
  const ChatPageAppBarTitle({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    context.read<MessageCubit>().isTyping(receiverID: user.userID);
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = user.userID;
          final data = state.userModel
              .firstWhere((element) => element.userID == currentUser);
          // context.read<MessageCubit>().isTyping(receiverID: data.userID);
          String text;
          int differenceInMinutes =
              Timestamp.now().toDate().difference(data.onlineStatue).inMinutes;
          int differenceInHours =
              Timestamp.now().toDate().difference(data.onlineStatue).inHours;
          int differenceInDays =
              Timestamp.now().toDate().difference(data.onlineStatue).inDays;

          if (differenceInMinutes < 1) {
            text = 'Active Now';
          } else if (differenceInMinutes < 60) {
            if (differenceInMinutes == 1) {
              text = 'Last Active $differenceInMinutes minute ago';
            } else {
              text = 'Last Active $differenceInMinutes minutes ago';
            }
          } else if (differenceInHours < 24) {
            if (differenceInHours == 1) {
              text = 'Last Active $differenceInHours hour ago';
            } else {
              text = 'Last Active $differenceInHours hours ago';
            }
          } else if (differenceInDays < 7) {
            if (differenceInDays == 1) {
              text = 'Last Active $differenceInDays day ago';
            } else {
              text = 'Last Active $differenceInDays days ago';
            }
          } else {
            int weeks = differenceInDays ~/ 7;
            int remainingDays = differenceInDays % 7;
            if (weeks == 1) {
              text = 'Last Active 1 week ago';
            } else {
              text = 'Last Active $weeks weeks';
              if (remainingDays > 0) {
                text += ' and $remainingDays days';
              }
              text += ' ago';
            }
          }
          return Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () => showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) =>
                                ChatPageFriendInfoBottomSheet(user: data)
                          ),
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              CachedNetworkImageProvider(data.profileImage))),
                  SizedBox(width: size.width * .02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.userName,
                        style: TextStyle(
                          fontSize: size.width * .04,
                        ),
                      ),
                      BlocBuilder<MessageCubit, MessageState>(
                        builder: (context, state) {
                          if (state is TypingSuccess) {
                            return Text(
                              state.isTyping ? 'type...' : text,
                              style: TextStyle(
                                  fontSize: state.isTyping
                                      ? size.width * .025
                                      : size.width * .02),
                            );
                          } else {
                            return Text(text,
                                style: TextStyle(fontSize: size.width * .02));
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
