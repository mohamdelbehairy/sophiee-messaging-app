import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../cubit/chat_media_files/chat_store_media_files/chat_store_media_files_cubit.dart';
import '../../../../../cubit/message/message_cubit.dart';
import '../../../../../cubit/notification/message_notification/message_notification_cubit.dart';
import '../../../../../cubit/upload/upload_file/upload_file_cubit.dart';
import '../../../../../cubit/user_date/get_user_data/get_user_data_cubit.dart';
import '../../../../../cubit/user_date/get_user_data/get_user_data_state.dart';
import '../pick_item_send_chat_item.dart';
import 'pick_file_page_body.dart';

class PickFileButton extends StatelessWidget {
  const PickFileButton(
      {super.key,
      required this.size,
      required this.widget,
      required this.uploadFile,
      required this.message,
      required this.controller,
      required this.storeMedia,
      required this.sendMessageNotification});

  final Size size;
  final PickFilePageBody widget;
  final UploadFileCubit uploadFile;
  final MessageCubit message;
  final TextEditingController controller;
  final ChatStoreMediaFilesCubit storeMedia;
  final MessageNotificationCubit sendMessageNotification;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: size.width,
      bottom: size.height * .015,
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
                  isClick: widget.isLoading,
                  onTap: () async {
                    String fileUrl = await uploadFile.uploadFile(
                        fieldName: 'messages_files', file: widget.file);
                    String messageID = const Uuid().v4();
                    await message.sendMessage(
                        messageID: messageID,
                        friendNameReplay: widget.friendNameReplay,
                        replayMessageID: widget.replayMessageID,
                        receiverID: widget.user.userID,
                        messageText: controller.text,
                        userName: widget.user.userName,
                        profileImage: widget.user.profileImage,
                        userID: widget.user.userID,
                        myUserName: userData.userName,
                        myProfileImage: userData.profileImage,
                        imageUrl: null,
                        videoUrl: null,
                        phoneContactNumber: null,
                        phoneContactName: null,
                        fileUrl: fileUrl,
                        messageFileName: widget.messageFileName,
                        replayFileMessage: widget.replayFileMessage,
                        replayTextMessage: widget.replayTextMessage,
                        replayImageMessage: widget.replayImageMessage,
                        replayContactMessage: widget.replayContactMessage,
                        replaySoundMessage: widget.replaySoundMessage,
                        replayRecordMessage: widget.replayRecordMessage);
                    await storeMedia.storeFile(
                        friendID: widget.user.userID,
                        messageID: messageID,
                        messageFile: fileUrl,
                        messageFileName: widget.messageFileName,
                        messageFileSize:
                            await widget.file.length() / 1024 < 1024
                                ? await widget.file.length() / 1024
                                : await widget.file.length() / 1024 / 1024,
                        messageFileType:
                            await widget.file.length() / 1024 < 1024
                                ? 'KB'
                                : 'MB');

                    if (widget.user.isChatNotify &&
                        !friendData.muteUsers.contains(userData.userID)) {
                      await sendMessageNotification.sendMessageNotification(
                          receiverToken: friendData.token,
                          senderName: userData.userName,
                          message:
                              '${userData.userName.split(' ')[0]} sent file',
                          senderId: userData.userID);
                    }

                    if (controller.text.startsWith('http') ||
                        controller.text.startsWith('https')) {
                      storeMedia.storeLink(
                          messageID: messageID,
                          friendID: widget.user.userID,
                          messageLink: controller.text);
                    }
                  });
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
