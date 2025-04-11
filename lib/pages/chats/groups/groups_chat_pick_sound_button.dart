import 'dart:io';

import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/cubit/upload/upload_audio/upload_audio_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../cubit/notification/group_notification/group_notification_cubit.dart';

class GroupsChatPickSoundButton extends StatefulWidget {
  const GroupsChatPickSoundButton(
      {super.key,
      required this.size,
      required this.sound,
      required this.groupModel,
      required this.audioName,
      required this.replayTextMessage,
      required this.replayImageMessage,
      required this.replayFileMessage,
      required this.friendNameReplay,
      required this.replayMessageID,
      required this.replayContactMessage,
      required this.replaySoundMessage,
      required this.replayRecordMessage,
      required this.tokens,
      required this.senderName,
      required this.isNotify});
  final Size size;
  final File sound;
  final GroupModel groupModel;
  final String audioName;
  final String replayTextMessage;
  final String replayImageMessage;
  final String replayFileMessage;
  final String friendNameReplay;
  final String replayMessageID;
  final String replayContactMessage;
  final String replaySoundMessage;
  final String replayRecordMessage;
  final List<String> tokens;
  final String senderName;
  final List<bool> isNotify;

  @override
  State<GroupsChatPickSoundButton> createState() =>
      _GroupsChatPickSoundButtonState();
}

class _GroupsChatPickSoundButtonState extends State<GroupsChatPickSoundButton> {
  bool isLoading = false;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    computeAndPrintDuration();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var uploadAudio = context.read<UploadAudioCubit>();
    var sendMessage = context.read<GroupMessageCubit>();
    var storeMedia = context.read<GroupStoreMediaFilesCubit>();
    var sendGroupMessageNotify = context.read<GroupNotificationCubit>();

    return Positioned(
      bottom: widget.size.height * .1,
      right: widget.size.width * .04,
      child: GestureDetector(
        onTap: () async {
          try {
            setState(() {
              isLoading = true;
            });
            String audioUrl = await uploadAudio.uploadAudio(
                audioField: 'groups_messages_sound', audioFile: widget.sound);
            String? audioTime = await computeAndPrintDuration();
            String messageID = const Uuid().v4();

            await sendMessage.sendGroupMessage(
                messageID: messageID,
                audioUrl: audioUrl,
                audioName: widget.audioName,
                audioTime: audioTime,
                messageText: '',
                groupID: widget.groupModel.groupID,
                replayImageMessage: widget.replayImageMessage,
                friendNameReplay: widget.friendNameReplay,
                replayMessageID: widget.replayMessageID,
                replayContactMessage: widget.replayContactMessage,
                replayFileMessage: widget.replayFileMessage,
                replayTextMessage: widget.replayTextMessage,
                replaySoundMessage: widget.replaySoundMessage,
                replayRecordMessage: widget.replayRecordMessage);

            for (int i = 0; i < widget.tokens.length; i++) {
              if (widget.isNotify[i]) {
                sendGroupMessageNotify.sendGroupMessageNotification(
                    receiverToken: widget.tokens[i],
                    senderName: widget.groupModel.groupName,
                    message: '${widget.senderName.split(' ')[0]} sent a sound',
                    senderId: widget.groupModel.groupID);
              }
            }
            await storeMedia.storeVoice(
                groupID: widget.groupModel.groupID,
                messageID: messageID,
                messageSound: audioUrl,
                messageSoundName: widget.audioName);

            navigation();
          } finally {
            setState(() {
              isLoading = false;
            });
          }
        },
        child: CircleAvatar(
          radius: widget.size.height * .045,
          backgroundColor: kPrimaryColor,
          child: isLoading
              ? SizedBox(
                  height: widget.size.height * .035,
                  width: widget.size.width * .07,
                  child: const CircularProgressIndicator(color: Colors.white))
              : Icon(Icons.send,
                  color: Colors.white, size: widget.size.height * .04),
        ),
      ),
    );
  }

  Future<String?> computeAndPrintDuration() async {
    audioPlayer.setSource(DeviceFileSource(widget.sound.path));

    Duration? audioDuration = await audioPlayer.getDuration();

    if (audioDuration == null) {
      return null;
    }
    String formattedDuration = formatTime(audioDuration.inSeconds);
    return formattedDuration;
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void navigation() {
    Navigation.pop(context: context);
  }
}
