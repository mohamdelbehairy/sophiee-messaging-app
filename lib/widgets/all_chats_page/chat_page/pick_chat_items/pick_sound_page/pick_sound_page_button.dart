import 'dart:io';

import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/chat_media_files/chat_store_media_files/chat_store_media_files_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/cubit/upload/upload_audio/upload_audio_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class PickSoundPageButton extends StatefulWidget {
  const PickSoundPageButton(
      {super.key,
      required this.size,
      required this.audioFile,
      required this.user,
      required this.audioName,
      required this.friendNameReplay,
      required this.replayMessageID,
      required this.replayTextMessage,
      required this.replayImageMessage,
      required this.replayFileMessage,
      required this.replayContactMessage,
      required this.replaySoundMessage,
      required this.replayRecordMessage});
  final Size size;
  final File audioFile;
  final UserModel user;
  final String audioName;
  final String friendNameReplay;
  final String replayMessageID;
  final String replayTextMessage;
  final String replayImageMessage;
  final String replayFileMessage;
  final String replayContactMessage;
  final String replaySoundMessage;
  final String replayRecordMessage;

  @override
  State<PickSoundPageButton> createState() => _PickSoundPageButtonState();
}

class _PickSoundPageButtonState extends State<PickSoundPageButton> {
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
    var sendMessage = context.read<MessageCubit>();
    var storeMedia = context.read<ChatStoreMediaFilesCubit>();

    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = FirebaseAuth.instance.currentUser;
          if (currentUser != null) {
            final userData = state.userModel
                .firstWhere((element) => element.userID == currentUser.uid);
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
                        audioField: 'messages_audio',
                        audioFile: widget.audioFile);
                    String? audioTime = await computeAndPrintDuration();
                    debugPrint('audio time: $audioTime');
                    String messageID = const Uuid().v4();
                    await sendMessage.sendMessage(
                        messageID: messageID,
                        audioUrl: audioUrl,
                        audioName: widget.audioName,
                        audioTime: audioTime,
                        receiverID: widget.user.userID,
                        messageText: '',
                        userName: widget.user.userName,
                        profileImage: widget.user.profileImage,
                        userID: widget.user.userID,
                        myUserName: userData.userName,
                        myProfileImage: userData.profileImage,
                        friendNameReplay: widget.friendNameReplay,
                        replayMessageID: widget.replayMessageID,
                        replayTextMessage: widget.replayTextMessage,
                        replayImageMessage: widget.replayImageMessage,
                        replayFileMessage: widget.replayFileMessage,
                        replayContactMessage: widget.replayContactMessage,
                        replaySoundMessage: widget.replaySoundMessage,
                        replayRecordMessage: widget.replayRecordMessage);
                    await storeMedia.storeVoice(
                        friendID: widget.user.userID,
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
                  radius: widget.size.height * .035,
                  backgroundColor: kPrimaryColor,
                  child: isLoading
                      ? SizedBox(
                          height: widget.size.height * .03,
                          width: widget.size.width * .065,
                          child: const CircularProgressIndicator(color: Colors.white))
                      : Icon(Icons.send,
                          color: Colors.white, size: widget.size.height * .035),
                ),
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
  }

  Future<String?> computeAndPrintDuration() async {
    audioPlayer.setSource(DeviceFileSource(widget.audioFile.path));

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
    Navigation.navigationOnePop(context: context);
  }
}
