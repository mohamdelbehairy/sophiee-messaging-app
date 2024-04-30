import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/cubit/message/message_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemBottomSubTitleListTile extends StatelessWidget {
  const ItemBottomSubTitleListTile(
      {super.key, required this.user, required this.data});
  final UserModel user;
  final UserModel data;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;
    context.read<MessageCubit>().isTyping(receiverID: data.userID);
    return BlocBuilder<MessageCubit, MessageState>(
      builder: (context, state) {
        if (state is TypingSuccess && state.isTyping == true) {
          return Text('type...',
              style: TextStyle(color: isDark ? Colors.white : Colors.black));
        }
        return Row(
          children: [
            // if (user.lastMessage?['senderID'] ==
            //     FirebaseAuth.instance.currentUser!.uid)
            //   Icon(user.lastMessage?['isSeen'] ? Icons.done_all : Icons.done,
            //       size: size.width * .045, color: Colors.grey),
            // SizedBox(width: size.width * .005),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: size.width * .25),
                child: Text(
                  user.lastMessage?['record'] != null &&
                          user.lastMessage?['senderID'] ==
                              FirebaseAuth.instance.currentUser!.uid ? 'you send record':  
                              user.lastMessage?['record'] != null &&
                                  user.lastMessage?['senderID'] !=
                                      FirebaseAuth.instance.currentUser!.uid
                              ? '${data.userName.split(' ')[0]} send record':
                  user.lastMessage?['audio'] != null &&
                          user.lastMessage?['senderID'] ==
                              FirebaseAuth.instance.currentUser!.uid
                      ? 'you send sound' : 
                      user.lastMessage?['audio'] != null &&
                                  user.lastMessage?['senderID'] !=
                                      FirebaseAuth.instance.currentUser!.uid
                              ? '${data.userName.split(' ')[0]} send sound'
                      : user.lastMessage?['video'] != null &&
                              user.lastMessage?['senderID'] ==
                                  FirebaseAuth.instance.currentUser!.uid
                          ? 'you send video' 
                          : user.lastMessage?['video'] != null &&
                                  user.lastMessage?['senderID'] !=
                                      FirebaseAuth.instance.currentUser!.uid
                              ? '${data.userName.split(' ')[0]} send video'
                              : user.lastMessage?['phoneContactNumber'] != null &&
                                      user.lastMessage?['senderID'] ==
                                          FirebaseAuth.instance.currentUser!.uid
                                  ? 'you share contact'
                                  : user.lastMessage?['phoneContactNumber'] !=
                                              null &&
                                          user.lastMessage?['senderID'] !=
                                              FirebaseAuth
                                                  .instance.currentUser!.uid
                                      ? '${data.userName.split(' ')[0]} share contact'
                                      : user.lastMessage?['file'] != null &&
                                              user.lastMessage?['senderID'] ==
                                                  FirebaseAuth
                                                      .instance.currentUser!.uid
                                          ? 'you send file'
                                          : user.lastMessage?['file'] != null &&
                                                  user.lastMessage?['senderID'] !=
                                                      FirebaseAuth.instance
                                                          .currentUser!.uid
                                              ? '${data.userName.split(' ')[0]} send file'
                                              : user.lastMessage?['image'] !=
                                                          null &&
                                                      user.lastMessage?['senderID'] ==
                                                          FirebaseAuth.instance
                                                              .currentUser!.uid
                                                  ? 'you send image'
                                                  : user.lastMessage?['image'] !=
                                                              null &&
                                                          user.lastMessage?['senderID'] !=
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid
                                                      ? '${data.userName.split(' ')[0]} send image'
                                                      : user.lastMessage?['text'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 13,
                      color: user.lastMessage?['isSeen'] &&
                              user.lastMessage?['senderID'] !=
                                  FirebaseAuth.instance.currentUser!.uid
                          ? Colors.grey
                          : user.lastMessage?['senderID'] ==
                                  FirebaseAuth.instance.currentUser!.uid
                              ? isDark
                                  ? Colors.white
                                  : Colors.black
                              : isDark
                                  ? Colors.white
                                  : Colors.black),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
