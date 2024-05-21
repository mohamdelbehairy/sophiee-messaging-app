import 'dart:io';

import 'package:sophiee/cubit/chat_media_files/chat_store_media_files/chat_store_media_files_cubit.dart';
import 'package:sophiee/cubit/notification/message_notification/message_notification_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/cubit/upload/upload_video/upload_video_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_item_send_chat_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class PickVideoSendVideoMessageButton extends StatefulWidget {
  const PickVideoSendVideoMessageButton(
      {super.key,
      required this.size,
      required this.user,
      required this.video,
      required this.controller});
  final Size size;
  final UserModel user;
  final File video;
  final TextEditingController controller;

  @override
  State<PickVideoSendVideoMessageButton> createState() =>
      _PickVideoSendVideoMessageButtonState();
}

class _PickVideoSendVideoMessageButtonState
    extends State<PickVideoSendVideoMessageButton> {
  bool isClick = false;

  navigation() {
    Navigation.navigationOnePop(context: context);
  }

  @override
  Widget build(BuildContext context) {
    var uploadVideo = context.read<UploadVideoCubit>();
    var message = context.read<MessageCubit>();
    var storeMedia = context.read<ChatStoreMediaFilesCubit>();
    var sendMessageNotification = context.read<MessageNotificationCubit>();

    return Positioned(
      width: widget.size.width,
      bottom: widget.size.height * .015,
      child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
        builder: (context, state) {
          if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
            final currentUser = FirebaseAuth.instance.currentUser;
            final friendUser = widget.user.userID;
            final friendData = state.userModel
                .firstWhere((element) => element.userID == friendUser);
            if (currentUser != null) {
              final userData = state.userModel
                  .firstWhere((element) => element.userID == currentUser.uid);
              return PickItemSendChatItemBottom(
                user: widget.user,
                isClick: isClick,
                onTap: () async {
                  try {
                    setState(() {
                      isClick = true;
                    });
                    String videoUrl = await uploadVideo.uploadVideo(
                        fieldName: 'messages_videos', videoFile: widget.video);
                    String messageID = const Uuid().v4();
                    await message.sendMessage(
                      messageID: messageID,
                      friendNameReplay: '',
                      replayImageMessage: '',
                      replayMessageID: '',
                      imageUrl: null,
                      fileUrl: null,
                      phoneContactNumber: null,
                      phoneContactName: null,
                      videoUrl: videoUrl,
                      receiverID: widget.user.userID,
                      messageText: widget.controller.text,
                      userName: widget.user.userName,
                      profileImage: widget.user.profileImage,
                      userID: widget.user.userID,
                      myUserName: userData.userName,
                      myProfileImage: userData.profileImage,
                      // context: context
                    );
                    await storeMedia.storeMedia(
                        friendID: widget.user.userID,
                        messageVideo: videoUrl,
                        messageID: messageID,
                        messageText: widget.controller.text.isEmpty
                            ? widget.controller.text
                            : null);
                    if (widget.user.isChatNotify) {
                      await sendMessageNotification.sendMessageNotification(
                          receiverToken: friendData.token,
                          senderName: userData.userName,
                          message:
                              '${userData.userName.split(' ')[0]} sent a video',
                          senderId: userData.userID);
                    }

                    if (widget.controller.text.startsWith('http') ||
                        widget.controller.text.startsWith('https')) {
                      storeMedia.storeLink(
                          messageID: messageID,
                          friendID: widget.user.userID,
                          messageLink: widget.controller.text);
                    }
                  } finally {
                    setState(() {
                      isClick = false;
                    });
                    navigation();
                  }
                },
              );
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
