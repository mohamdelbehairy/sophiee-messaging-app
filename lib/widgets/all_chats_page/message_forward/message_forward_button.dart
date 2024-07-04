import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/chat_media_files/chat_store_media_files/chat_store_media_files_cubit.dart';
import 'package:sophiee/cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';
import 'package:sophiee/cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';
import 'package:sophiee/cubit/notification/group_notification/group_notification_cubit.dart';
import 'package:sophiee/cubit/notification/message_notification/message_notification_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/models/media_files_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../cubit/groups/get_groups_member/get_groups_member_cubit.dart';
import '../../../cubit/groups/get_groups_member/get_groups_member_state.dart';
import '../../../utils/widget/flutter_toast_widget.dart';

class MessageForwardButton extends StatefulWidget {
  const MessageForwardButton(
      {super.key, this.message, required this.user, this.mediaFiles});
  final MessageModel? message;
  final MediaFilesModel? mediaFiles;
  final UserModel? user;

  @override
  State<MessageForwardButton> createState() => _MessageForwardButtonState();
}

class _MessageForwardButtonState extends State<MessageForwardButton> {
  bool isCircle = false;

  // showToastMethod() {
  //   showToastMedthod(
  //       context: context,
  //       showToastText: 'Message forward successfully',
  //       position: StyledToastPosition.center);
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var selectedFriend = context.read<ForwardSelectedFriendCubit>();
    var selectedGroup = context.read<ForwardSelectedGroupCubit>();
    var sendMessage = context.read<MessageCubit>();
    var sendGroupMessage = context.read<GroupMessageCubit>();
    var storeGroupMedia = context.read<GroupStoreMediaFilesCubit>();
    var storeChatMedia = context.read<ChatStoreMediaFilesCubit>();
    var sendMessageNotification = context.read<MessageNotificationCubit>();
    var sendGroupNotification = context.read<GroupNotificationCubit>();

    return BlocBuilder<GetGroupsMemberCubit, GetGroupsMemberState>(
      builder: (context, groupState) {
        return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
          builder: (context, state) {
            if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
              final currentUser = FirebaseAuth.instance.currentUser;
              if (currentUser != null) {
                final userData = state.userModel
                    .firstWhere((element) => element.userID == currentUser.uid);
                return GestureDetector(
                  onTap: () async {
                    try {
                      setState(() {
                        isCircle = true;
                      });
                      if (selectedFriend.selectedFriendList.isNotEmpty) {
                        String messageID = const Uuid().v4();
                        for (var friend in selectedFriend.selectedFriendList) {
                          final friendData = state.userModel.firstWhere(
                              (element) => element.userID == friend.userID);
                          if (widget.message != null) {
                            await sendMessage.sendMessage(
                                messageID: messageID,
                                imageUrl: widget.message!.messageImage,
                                videoUrl: widget.message!.messageVideo,
                                fileUrl: widget.message!.messageFile,
                                audioUrl: widget.message!.messageSound,
                                audioName: widget.message!.messageSoundName,
                                audioTime: widget.message!.messageSoundTime,
                                recordUrl: widget.message!.messageRecord,
                                recordTime: widget.message!.messageRecordTime,
                                phoneContactName:
                                    widget.message!.phoneContactName,
                                phoneContactNumber:
                                    widget.message!.phoneContactNumber,
                                messageFileName:
                                    widget.message!.messageFileName,
                                receiverID: friend.userID,
                                messageText: widget.message!.messageText,
                                userName: friend.userName,
                                profileImage: friend.profileImage,
                                userID: friend.userID,
                                myUserName: userData.userName,
                                myProfileImage: userData.profileImage,
                                messageFileSize:
                                    widget.message!.messageFileSize,
                                messageFileType:
                                    widget.message!.messageFileType,
                                friendNameReplay: '',
                                replayMessageID: '',
                                replayContactMessage: '',
                                replayFileMessage: '',
                                replayImageMessage: '',
                                replayTextMessage: '',
                                replayRecordMessage: '',
                                replaySoundMessage: '');

                            if (widget.message!.messageFile != null) {
                              await storeChatMedia.storeFile(
                                  friendID: friend.userID,
                                  messageID: messageID,
                                  messageFile: widget.message!.messageFile,
                                  messageFileName:
                                      widget.message!.messageFileName,
                                  messageFileSize:
                                      widget.message!.messageFileSize,
                                  messageFileType:
                                      widget.message!.messageFileType);
                              if (friendData.isChatNotify) {
                                await sendMessageNotification
                                    .sendMessageNotification(
                                        receiverToken: friendData.token,
                                        senderName: userData.userName,
                                        message:
                                            '${userData.userName.split(' ')[0]} sent a file',
                                        senderId: userData.userID);
                              }
                            }
                            if (widget.message!.phoneContactNumber != null &&
                                friendData.isChatNotify) {
                              await sendMessageNotification.sendMessageNotification(
                                  receiverToken: friendData.token,
                                  senderName: userData.userName,
                                  message:
                                      '${userData.userName.split(' ')[0]} shared a contact',
                                  senderId: userData.userID);
                            }
                            if (widget.message!.messageSound != null) {
                              await storeChatMedia.storeVoice(
                                  friendID: friend.userID,
                                  messageID: messageID,
                                  messageSound: widget.message!.messageSound,
                                  messageSoundName:
                                      widget.message!.messageFileName);
                              if (friendData.isChatNotify) {
                                await sendMessageNotification
                                    .sendMessageNotification(
                                        receiverToken: friendData.token,
                                        senderName: userData.userName,
                                        message:
                                            '${userData.userName.split(' ')[0]} sent a sound',
                                        senderId: userData.userID);
                              }
                            }
                            if (widget.message!.messageRecord != null) {
                              await storeChatMedia.storeVoice(
                                  friendID: friend.userID,
                                  messageID: messageID,
                                  messageRecord: widget.message!.messageRecord);
                              if (friendData.isChatNotify) {
                                await sendMessageNotification
                                    .sendMessageNotification(
                                        receiverToken: friendData.token,
                                        senderName: userData.userName,
                                        message:
                                            '${userData.userName.split(' ')[0]} sent a voice message',
                                        senderId: userData.userID);
                              }
                            }
                            if (widget.message!.messageImage != null ||
                                widget.message!.messageVideo != null) {
                              if (widget.message!.messageVideo != null &&
                                  friendData.isChatNotify) {
                                await sendMessageNotification
                                    .sendMessageNotification(
                                        receiverToken: friendData.token,
                                        senderName: userData.userName,
                                        message:
                                            '${userData.userName.split(' ')[0]} sent a video',
                                        senderId: userData.userID);
                              } else {
                                if (friendData.isChatNotify) {
                                  await sendMessageNotification
                                      .sendMessageNotification(
                                          receiverToken: friendData.token,
                                          senderName: userData.userName,
                                          message:
                                              '${userData.userName.split(' ')[0]} sent an image',
                                          senderId: userData.userID);
                                }
                              }
                              await storeChatMedia.storeMedia(
                                  friendID: friend.userID,
                                  messageID: messageID,
                                  messageText: widget.message!.messageText,
                                  messageImage: widget.message!.messageImage,
                                  messageVideo: widget.message!.messageVideo);
                            }
                            if (widget.message!.messageText
                                    .startsWith('http') ||
                                widget.message!.messageText
                                    .startsWith('http')) {
                              await storeChatMedia.storeLink(
                                  friendID: friend.userID,
                                  messageID: messageID,
                                  messageLink: widget.message!.messageText);
                              if (friendData.isChatNotify) {
                                await sendMessageNotification
                                    .sendMessageNotification(
                                        receiverToken: friendData.token,
                                        senderName: userData.userName,
                                        message: widget.message!.messageText,
                                        senderId: userData.userID);
                              }
                            }
                          } else {
                            await sendMessage.sendMessage(
                                messageID: messageID,
                                imageUrl: widget.mediaFiles!.messageImage,
                                videoUrl: widget.mediaFiles!.messageVideo,
                                // fileUrl: widget.message!.messageFile,
                                // audioUrl: widget.message!.messageSound,
                                // audioName: widget.message!.messageSoundName,
                                // audioTime: widget.message!.messageSoundTime,
                                // recordUrl: widget.message!.messageRecord,
                                // recordTime: widget.message!.messageRecordTime,
                                // phoneContactName: widget.message!.phoneContactName,
                                // phoneContactNumber:
                                //     widget.message!.phoneContactNumber,
                                // messageFileName: widget.message!.messageFileName,

                                messageText:
                                    widget.mediaFiles!.messageText != null
                                        ? widget.mediaFiles!.messageText!
                                        : '',
                                receiverID: friend.userID,
                                userName: friend.userName,
                                profileImage: friend.profileImage,
                                userID: friend.userID,
                                myUserName: userData.userName,
                                myProfileImage: userData.profileImage,
                                friendNameReplay: '',
                                replayMessageID: '',
                                replayContactMessage: '',
                                replayFileMessage: '',
                                replayImageMessage: '',
                                replayTextMessage: '',
                                replayRecordMessage: '',
                                replaySoundMessage: '');
                            if (widget.mediaFiles!.messageVideo != null &&
                                friendData.isChatNotify) {
                              await sendMessageNotification.sendMessageNotification(
                                  receiverToken: friendData.token,
                                  senderName: userData.userName,
                                  message:
                                      '${userData.userName.split(' ')[0]} sent a video',
                                  senderId: userData.userID);
                            } else {
                              if (friendData.isChatNotify) {
                                await sendMessageNotification
                                    .sendMessageNotification(
                                        receiverToken: friendData.token,
                                        senderName: userData.userName,
                                        message:
                                            '${userData.userName.split(' ')[0]} sent an image',
                                        senderId: userData.userID);
                              }
                            }
                            await storeChatMedia.storeMedia(
                                friendID: friend.userID,
                                messageID: messageID,
                                messageText:
                                    widget.mediaFiles!.messageText != null
                                        ? widget.mediaFiles!.messageText!
                                        : '',
                                messageImage: widget.mediaFiles!.messageImage,
                                messageVideo: widget.mediaFiles!.messageVideo);
                          }
                        }
                      }

                      if (selectedGroup.selectedGroupList.isNotEmpty) {
                        String messageID = const Uuid().v4();
                        for (var group in selectedGroup.selectedGroupList) {
                          if (groupState is GetGroupsMemberSuccess &&
                              groupState.groupsList.isNotEmpty) {
                            var groupData = groupState.groupsList.firstWhere(
                                (element) => element.groupID == group);
                            for (var groupUserID in groupData.usersID) {
                              if (groupUserID !=
                                  FirebaseAuth.instance.currentUser!.uid) {
                                var groupuserData = state.userModel.firstWhere(
                                    (element) => element.userID == groupUserID);

                                if (widget.message != null) {
                                  await sendGroupMessage.sendGroupMessage(
                                      groupID: group,
                                      messageID: messageID,
                                      messageText: widget.message!.messageText,
                                      imageUrl: widget.message!.messageImage,
                                      videoUrl: widget.message!.messageVideo,
                                      fileUrl: widget.message!.messageFile,
                                      audioUrl: widget.message!.messageSound,
                                      audioName:
                                          widget.message!.messageSoundName,
                                      audioTime:
                                          widget.message!.messageSoundTime,
                                      recordUrl: widget.message!.messageRecord,
                                      recordTime:
                                          widget.message!.messageRecordTime,
                                      messageFileName:
                                          widget.message!.messageFileName,
                                      phoneContactName:
                                          widget.message!.phoneContactName,
                                      phoneContactNumber:
                                          widget.message!.phoneContactNumber,
                                      messageFileSize:
                                          widget.message!.messageFileSize,
                                      messageFileType:
                                          widget.message!.messageFileType,
                                      friendNameReplay: '',
                                      replayMessageID: '',
                                      replayContactMessage: '',
                                      replayFileMessage: '',
                                      replayImageMessage: '',
                                      replayTextMessage: '',
                                      replayRecordMessage: '',
                                      replaySoundMessage: '');

                                  if (widget.message!.messageFile != null) {
                                    await storeGroupMedia.storeFile(
                                        groupID: group,
                                        messageID: messageID,
                                        messageFile:
                                            widget.message!.messageFile,
                                        messageFileName:
                                            widget.message!.messageFileName,
                                        messageFileSize:
                                            widget.message!.messageFileSize,
                                        messageFileType:
                                            widget.message!.messageFileType);
                                    if (groupuserData.isGroupNotify) {
                                      await sendGroupNotification
                                          .sendGroupMessageNotification(
                                              receiverToken:
                                                  groupuserData.token,
                                              senderName: groupData.groupName,
                                              message:
                                                  '${userData.userName.split(' ')[0]} sent a file',
                                              senderId: groupData.groupID);
                                    }
                                  }
                                  if (widget.message!.phoneContactNumber !=
                                          null &&
                                      groupuserData.isGroupNotify) {
                                    await sendGroupNotification
                                        .sendGroupMessageNotification(
                                            receiverToken: groupuserData.token,
                                            senderName: groupData.groupName,
                                            message:
                                                '${userData.userName.split(' ')[0]} shared a contact',
                                            senderId: groupData.groupID);
                                  }

                                  if (widget.message!.messageSound != null &&
                                      groupuserData.isGroupNotify) {
                                    await sendGroupNotification
                                        .sendGroupMessageNotification(
                                            receiverToken: groupuserData.token,
                                            senderName: groupData.groupName,
                                            message:
                                                '${userData.userName.split(' ')[0]} sent a sound',
                                            senderId: groupData.groupID);
                                  }
                                  if (widget.message!.messageRecord != null &&
                                      groupuserData.isGroupNotify) {
                                    await sendGroupNotification
                                        .sendGroupMessageNotification(
                                            receiverToken: groupuserData.token,
                                            senderName: groupData.groupName,
                                            message:
                                                '${userData.userName.split(' ')[0]} sent a voice message',
                                            senderId: groupData.groupID);
                                  }

                                  if (widget.message!.messageImage != null ||
                                      widget.message!.messageVideo != null) {
                                    if (widget.message!.messageVideo != null &&
                                        groupuserData.isGroupNotify) {
                                      await sendGroupNotification
                                          .sendGroupMessageNotification(
                                              receiverToken:
                                                  groupuserData.token,
                                              senderName: groupData.groupName,
                                              message:
                                                  '${userData.userName.split(' ')[0]} sent video',
                                              senderId: groupData.groupID);
                                    } else {
                                      if (groupuserData.isChatNotify) {
                                        await sendGroupNotification
                                            .sendGroupMessageNotification(
                                                receiverToken:
                                                    groupuserData.token,
                                                senderName: groupData.groupName,
                                                message:
                                                    '${userData.userName.split(' ')[0]} sent an image',
                                                senderId: groupData.groupID);
                                      }
                                    }
                                    await storeGroupMedia.storeMedia(
                                      groupID: group,
                                      messageID: messageID,
                                      messageText: widget.message!.messageText,
                                      messageImage:
                                          widget.message!.messageImage,
                                      messageVideo:
                                          widget.message!.messageVideo,
                                    );
                                  }

                                  if (widget.message!.messageText
                                          .startsWith('http') ||
                                      widget.message!.messageText
                                          .startsWith('http')) {
                                    await storeGroupMedia.storeLink(
                                        groupID: group,
                                        messageID: messageID,
                                        messageLink:
                                            widget.message!.messageText);
                                    if (groupuserData.isGroupNotify) {
                                      await sendGroupNotification
                                          .sendGroupMessageNotification(
                                              receiverToken:
                                                  groupuserData.token,
                                              senderName: groupData.groupName,
                                              message:
                                                  widget.message!.messageText,
                                              senderId: groupData.groupID);
                                    }
                                  }
                                  if (widget.message!.messageRecord != null ||
                                      widget.message!.messageSound != null) {
                                    await storeGroupMedia.storeVoice(
                                        groupID: group,
                                        messageID: messageID,
                                        messageRecord:
                                            widget.message!.messageRecord,
                                        messageSound:
                                            widget.message!.messageSound,
                                        messageSoundName:
                                            widget.message!.messageSoundName);
                                  }
                                } else {
                                  await sendGroupMessage.sendGroupMessage(
                                      groupID: group,
                                      messageID: messageID,
                                      messageText:
                                          widget.mediaFiles!.messageText != null
                                              ? widget.mediaFiles!.messageText!
                                              : '',
                                      imageUrl: widget.mediaFiles!.messageImage,
                                      videoUrl: widget.mediaFiles!.messageVideo,
                                      // fileUrl: widget.message!.messageFile,
                                      // audioUrl: widget.message!.messageSound,
                                      // audioName: widget.message!.messageSoundName,
                                      // audioTime: widget.message!.messageSoundTime,
                                      // recordUrl: widget.message!.messageRecord,
                                      // recordTime: widget.message!.messageRecordTime,
                                      // messageFileName: widget.message!.messageFileName,
                                      // phoneContactName: widget.message!.phoneContactName,
                                      // phoneContactNumber:
                                      //     widget.message!.phoneContactNumber,
                                      friendNameReplay: '',
                                      replayMessageID: '',
                                      replayContactMessage: '',
                                      replayFileMessage: '',
                                      replayImageMessage: '',
                                      replayTextMessage: '',
                                      replayRecordMessage: '',
                                      replaySoundMessage: '');

                                  if (widget.mediaFiles!.messageVideo != null &&
                                      groupuserData.isGroupNotify) {
                                    await sendGroupNotification
                                        .sendGroupMessageNotification(
                                            receiverToken: groupuserData.token,
                                            senderName: groupData.groupName,
                                            message:
                                                '${userData.userName.split(' ')[0]} sent a video',
                                            senderId: groupData.groupID);
                                  } else {
                                    if (groupuserData.isGroupNotify) {
                                      await sendMessageNotification
                                          .sendMessageNotification(
                                              receiverToken:
                                                  groupuserData.token,
                                              senderName: groupData.groupName,
                                              message:
                                                  '${userData.userName.split(' ')[0]} sent an image',
                                              senderId: groupData.groupID);
                                    }
                                  }
                                  await storeGroupMedia.storeMedia(
                                      groupID: group,
                                      messageID: messageID,
                                      messageText:
                                          widget.mediaFiles!.messageText != null
                                              ? widget.mediaFiles!.messageText!
                                              : '',
                                      messageImage:
                                          widget.mediaFiles!.messageImage,
                                      messageVideo:
                                          widget.mediaFiles!.messageVideo);
                                }
                              }
                            }
                          }
                        }
                      }
                      FlutterToastWidget.showToast(
                          msg: "Message forward successfully");
                    } finally {
                      setState(() {
                        isCircle = false;
                      });
                      await selectedFriend.deleteAllSelectedFriends();
                      await selectedGroup.deleteAllSelectedGroups();
                    }
                  },
                  child: CircleAvatar(
                    radius: size.width * .08,
                    backgroundColor: kPrimaryColor,
                    child: isCircle
                        ? SizedBox(
                            height: size.width * .065,
                            width: size.width * .065,
                            child: const CircularProgressIndicator(
                                color: Colors.white))
                        : Icon(Icons.send,
                            color: Colors.white, size: size.width * .07),
                  ),
                );
              } else {
                return Container();
              }
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
