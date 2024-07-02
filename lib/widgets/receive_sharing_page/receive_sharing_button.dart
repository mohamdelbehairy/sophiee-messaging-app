import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:sophiee/cubit/upload/upload_video/upload_video_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';
import '../../cubit/chat_media_files/chat_store_media_files/chat_store_media_files_cubit.dart';
import '../../cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';
import '../../cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';
import '../../cubit/message/message_cubit.dart';
import '../../cubit/notification/message_notification/message_notification_cubit.dart';
import '../../cubit/upload/upload_image/upload_image_cubit.dart';

class ReceiveSharingButton extends StatelessWidget {
  const ReceiveSharingButton(
      {super.key,
      required this.size,
      required this.sharedFiles,
      required this.selectedFriend,
      required this.selectedGroup});

  final Size size;
  final ForwardSelectedFriendCubit selectedFriend;
  final ForwardSelectedGroupCubit selectedGroup;
  final List<SharedMediaFile> sharedFiles;

  @override
  Widget build(BuildContext context) {
    var uploadImage = context.read<UploadImageCubit>();
    var uploadVideo = context.read<UploadVideoCubit>();
    var sendMessage = context.read<MessageCubit>();
    var storeChatMedia = context.read<ChatStoreMediaFilesCubit>();
    var sendMessageNotification = context.read<MessageNotificationCubit>();

    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final userData = state.userModel.firstWhere((element) =>
              element.userID == FirebaseAuth.instance.currentUser!.uid);
          return GestureDetector(
            onTap: () async {
              String? imageUrl;
              String? videoUrl;
              String messageText = '';
              String messageID = const Uuid().v4();

              SharedMediaFile sharedMediaFile = sharedFiles.first;
              if (sharedMediaFile.type == SharedMediaType.image) {
                imageUrl = await uploadImage.uploadImage(
                    imageFile: File(sharedFiles.first.path),
                    fieldName: 'messages_images');
              } else if (sharedMediaFile.type == SharedMediaType.video) {
                videoUrl = await uploadVideo.uploadVideo(
                    videoFile: File(sharedFiles.first.path),
                    fieldName: 'messages_videos');
                log('video file: ${sharedFiles.first.path}');
              } else if (sharedMediaFile.type == SharedMediaType.text) {
                log('text: ${sharedFiles.first.path}');
                messageText = sharedFiles.first.path;
              } else if (sharedMediaFile.type == SharedMediaType.file) {
                log('file: ${sharedFiles.first.path}');
              }
              if (selectedFriend.selectedFriendList.isNotEmpty) {
                for (var user in selectedFriend.selectedFriendList) {
                  log('user: ${user.userID}');
                  var friendData = state.userModel
                      .firstWhere((element) => element.userID == user.userID);
                  await sendMessage.sendMessage(
                      receiverID: friendData.userID,
                      messageID: messageID,
                      messageText: messageText,
                      userName: friendData.userName,
                      profileImage: friendData.profileImage,
                      userID: friendData.userID,
                      myUserName: userData.userName,
                      myProfileImage: userData.profileImage,
                      imageUrl: imageUrl,
                      friendNameReplay: '',
                      replayMessageID: '',
                      replayContactMessage: '',
                      replayFileMessage: '',
                      replayImageMessage: '',
                      replayTextMessage: '',
                      replayRecordMessage: '',
                      replaySoundMessage: '');
                  if (imageUrl != null || videoUrl != null) {
                    if (videoUrl != null && friendData.isChatNotify) {
                      await sendMessageNotification.sendMessageNotification(
                          receiverToken: friendData.token,
                          senderName: userData.userName,
                          message:
                              '${userData.userName.split(' ')[0]} sent a video',
                          senderId: userData.userID);
                    } else {
                      if (friendData.isChatNotify) {
                        await sendMessageNotification.sendMessageNotification(
                            receiverToken: friendData.token,
                            senderName: userData.userName,
                            message:
                                '${userData.userName.split(' ')[0]} sent an image',
                            senderId: userData.userID);
                      }
                    }
                    await storeChatMedia.storeMedia(
                        friendID: friendData.userID,
                        messageID: messageID,
                        messageText: null,
                        messageImage: imageUrl,
                        messageVideo: videoUrl);
                  }
                }
              }

              // if (widget.selectedGroup.selectedGroupList.isNotEmpty) {
              //   for (var group in widget.selectedGroup.selectedGroupList) {
              //     log('group: $group');
              //   }
              // }
            },
            child: CircleAvatar(
                radius: size.width * .08,
                backgroundColor: kPrimaryColor,
                child: Icon(Icons.send,
                    color: Colors.white, size: size.width * .07)),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
