import 'dart:io';

import 'package:sophiee/cubit/chat_media_files/chat_store_media_files/chat_store_media_files_cubit.dart';
import 'package:sophiee/cubit/notification/message_notification/message_notification_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/cubit/upload/upload_video/upload_video_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_item_send_chat_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class PickVideoSendVideoMessageButton extends StatelessWidget {
  const PickVideoSendVideoMessageButton(
      {super.key,
      required this.size,
      required this.user,
      required this.video,
      required this.controller,
      required this.isLoading});
  final Size size;
  final UserModel user;
  final File video;
  final TextEditingController controller;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    var uploadVideo = context.read<UploadVideoCubit>();
    var message = context.read<MessageCubit>();
    var storeMedia = context.read<ChatStoreMediaFilesCubit>();
    var sendMessageNotification = context.read<MessageNotificationCubit>();

    return Positioned(
      width: size.width,
      bottom: size.height * .015,
      child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
        builder: (context, state) {
          if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
            final currentUser = FirebaseAuth.instance.currentUser;
            final friendUser = user.userID;
            final friendData = state.userModel
                .firstWhere((element) => element.userID == friendUser);
            if (currentUser != null) {
              final userData = state.userModel
                  .firstWhere((element) => element.userID == currentUser.uid);
              return PickItemSendChatItemBottom(
                user: user,
                isClick: isLoading,
                onTap: () async {
                  String videoUrl = await uploadVideo.uploadVideo(
                      fieldName: 'messages_videos', videoFile: video);
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
                    receiverID: user.userID,
                    messageText: controller.text,
                    userName: user.userName,
                    profileImage: user.profileImage,
                    userID: user.userID,
                    myUserName: userData.userName,
                    myProfileImage: userData.profileImage,
                    // context: context
                  );
                  await storeMedia.storeMedia(
                      friendID: user.userID,
                      messageVideo: videoUrl,
                      messageID: messageID,
                      messageText:
                          controller.text.isEmpty ? controller.text : null);
                  if (user.isChatNotify &&
                      !friendData.muteUsers.contains(userData.userID)) {
                    await sendMessageNotification.sendMessageNotification(
                        receiverToken: friendData.token,
                        senderName: userData.userName,
                        message:
                            '${userData.userName.split(' ')[0]} sent a video',
                        senderId: userData.userID);
                  }

                  if (controller.text.startsWith('http') ||
                      controller.text.startsWith('https')) {
                    storeMedia.storeLink(
                        messageID: messageID,
                        friendID: user.userID,
                        messageLink: controller.text);
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
