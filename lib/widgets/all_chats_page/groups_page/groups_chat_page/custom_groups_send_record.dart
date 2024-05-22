import 'dart:io';

import 'package:sophiee/cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/cubit/upload/upload_audio/upload_audio_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/chats/recorder_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../cubit/notification/group_notification/group_notification_cubit.dart';

class CustomGroupsSendRecord extends StatelessWidget {
  const CustomGroupsSendRecord(
      {super.key,
      required this.size,
      required this.groupChat,
      required this.groupModel,
      required this.isSwip,
      this.messageModel,
      this.userData,
      this.stopRecording,
      required this.tokens,
      required this.senderName,
      required this.isNotify});

  final Size size;
  final GroupMessageCubit groupChat;
  final GroupModel groupModel;
  final bool isSwip;
  final MessageModel? messageModel;
  final UserModel? userData;
  final Function(String)? stopRecording;
  final List<String> tokens;
  final String senderName;
  final List<bool> isNotify;

  @override
  Widget build(BuildContext context) {
    var uploadAudio = context.read<UploadAudioCubit>();
    var storeVoice = context.read<GroupStoreMediaFilesCubit>();
    var sendGroupChatNotify = context.read<GroupNotificationCubit>();

    return RecorderItem(
      size: size,
      stopRecording: stopRecording,
      sendRequestFunction: (File soundFile, String time) async {
        String audioUrl = await uploadAudio.uploadAudio(
            audioFile: soundFile, audioField: 'groups_messages_audio');
        String messageID = const Uuid().v4();
        await groupChat.sendGroupMessage(
          messageID: messageID,
          recordTime: time,
          recordUrl: audioUrl,
          messageText: '',
          groupID: groupModel.groupID,
          replayTextMessage: isSwip ? messageModel!.messageText : '',
          friendNameReplay: isSwip
              ? userData != null
                  ? userData!.userName
                  : ''
              : '',
          replayImageMessage: isSwip
              ? messageModel!.messageImage != null &&
                          messageModel!.messageText == '' ||
                      messageModel!.messageImage != null &&
                          messageModel!.messageText != ''
                  ? messageModel!.messageImage!
                  : ''
              : '',
          replayFileMessage: isSwip && messageModel!.messageFileName != null
              ? messageModel!.messageFileName!
              : '',
          replayContactMessage:
              isSwip && messageModel!.phoneContactNumber != null
                  ? messageModel!.phoneContactNumber!
                  : '',
          replayMessageID: isSwip ? messageModel!.messageID : '',
          replaySoundMessage: isSwip && messageModel!.messageSound != null
              ? messageModel!.messageSoundName!
              : '',
          replayRecordMessage: isSwip && messageModel!.messageRecord != null
              ? messageModel!.messageRecord!
              : '',
        );

        for (int i = 0; i < tokens.length; i++) {
          if (isNotify[i]) {
            sendGroupChatNotify.sendGroupMessageNotification(
                receiverToken: tokens[i],
                senderName: groupModel.groupName,
                message: '${senderName.split(' ')[0]} sent a voice message',
                senderId: groupModel.groupID);
          }
        }
        await storeVoice.storeVoice(
            messageID: messageID,
            groupID: groupModel.groupID,
            messageRecord: audioUrl);
      },
    );
  }
}
