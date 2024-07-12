import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/cubit/message/message_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_friend_info_bottom_sheet/chat_page_friend_info_bottom_sheet.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';

class ChatPageAppBarTitle extends StatelessWidget {
  const ChatPageAppBarTitle(
      {super.key, required this.user, required this.userData});
  final UserModel user, userData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var isDark = context.read<LoginCubit>().isDark;

    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = user.userID;
          final data = state.userModel
              .firstWhere((element) => element.userID == currentUser);

          String text;
          int differenceInMinutes =
              Timestamp.now().toDate().difference(data.onlineStatue).inMinutes;
          int differenceInHours =
              Timestamp.now().toDate().difference(data.onlineStatue).inHours;
          int differenceInDays =
              Timestamp.now().toDate().difference(data.onlineStatue).inDays;

          if (userData.blockUsers.contains(user.userID)) {
            text = 'last seen for a long time';
          } else if (!user.isLastSeendAndOnline) {
            text = 'last seen recently';
          } else if (differenceInMinutes < 1) {
            text = 'active now';
          } else if (differenceInMinutes < 60) {
            if (differenceInMinutes == 1) {
              text = 'last active $differenceInMinutes minute ago';
            } else {
              text = 'last active $differenceInMinutes minutes ago';
            }
          } else if (differenceInHours < 24) {
            if (differenceInHours == 1) {
              text = 'last active $differenceInHours hour ago';
            } else {
              text = 'Last Active $differenceInHours hours ago';
            }
          } else if (differenceInDays < 7) {
            if (differenceInDays == 1) {
              text = 'last active $differenceInDays day ago';
            } else {
              text = 'last active $differenceInDays days ago';
            }
          } else {
            int weeks = differenceInDays ~/ 7;

            if (weeks == 1) {
              text = 'last active 1 week ago';
            } else {
              text = 'last active $weeks weeks';
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
                          builder: (context) => ChatPageFriendBottomSheetInfo(
                              user: data, userData: userData)),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(size.height * .035),
                          child: FancyShimmerImage(
                              boxFit: BoxFit.cover,
                              shimmerBaseColor: isDark
                                  ? Colors.white12
                                  : Colors.grey.shade300,
                              shimmerHighlightColor: isDark
                                  ? Colors.white24
                                  : Colors.grey.shade100,
                              imageUrl: !data.isProfilePhotos ||
                                      userData.blockUsers.contains(user.userID)
                                  ? defaultProfileImageUrl
                                  : data.profileImage),
                        ),
                      )),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: size.width * .35,
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
