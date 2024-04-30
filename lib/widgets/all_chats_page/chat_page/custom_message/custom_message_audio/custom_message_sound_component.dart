import 'dart:async';

import 'package:sophiee/cubit/update_message_audio_playing/update_message_audio_playing_cubit.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_audio/custom_message_play_icon.dart';
import 'package:sophiee/utils/widget/messages/custom_message_sound_details.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomMessageSoundComponent extends StatefulWidget {
  const CustomMessageSoundComponent(
      {super.key,
      required this.user,
      required this.size,
      required this.message,
      required this.backgroungColor,
      required this.iconColor});
  final UserModel user;
  final Size size;
  final MessageModel message;
  final Color backgroungColor;
  final Color iconColor;

  @override
  State<CustomMessageSoundComponent> createState() =>
      _CustomMessageSoundComponentState();
}

class _CustomMessageSoundComponentState
    extends State<CustomMessageSoundComponent> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();

    audioPlayerStateChanged();
    audioPlayerDurationChanged();
    audioPlayerPositionChanged();
    audioPlayerComplete();
    // computeAndPrintDuration();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var updateMessageAudioPlaying =
        context.read<UpdateMessageAudioPlayingCubit>();
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: widget.message.messageSoundPlaying == false
                  ? widget.size.width * .03
                  : 0.0),
          child: CustomMessageAudioIcon(
              iconSize: widget.size.height * .018,
              backgroungColor: widget.backgroungColor,
              iconColor: widget.iconColor,
              size: widget.size,
              message: widget.message,
              icon: isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
              onTap: () async {
                await updateMessageAudioPlaying.updateChatMessageAudioPlaying(
                    messageSoundPlaying: true,
                    friendID: widget.user.userID,
                    messageID: widget.message.messageID);
                if (isPlaying) {
                  await audioPlayer.pause();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  if (audioPlayer.state == PlayerState.playing) {
                    await audioPlayer.stop();
                  }
                  audioPlayer.onPlayerComplete.listen((event) {
                    setState(() {
                      isPlaying = false;
                    });
                  });
                  await audioPlayer
                      .play(UrlSource(widget.message.messageSound!));
                  setState(() {
                    isPlaying = true;
                  });
                }
              }),
        ),
        CustomMessageSoudDetails(
            nameColor: widget.backgroungColor,
            size: widget.size,
            duration: duration,
            position: position,
            message: widget.message,
            audioPlayer: audioPlayer)
      ],
    );
  }

  StreamSubscription<PlayerState> audioPlayerStateChanged() {
    return audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });
  }

  void audioPlayerDurationChanged() {
    audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration;
        });
      }
    });
  }

  void audioPlayerPositionChanged() {
    audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          position = newPosition;
        });
      }
    });
  }

  StreamSubscription<void> audioPlayerComplete() {
    return audioPlayer.onPlayerComplete.listen((event) async {
      if (mounted) {
        setState(() {
          isPlaying = false;
          position = Duration.zero;
        });
        var update = context.read<UpdateMessageAudioPlayingCubit>();
        await update.updateChatMessageAudioPlaying(
            friendID: widget.user.userID,
            messageID: widget.message.messageID,
            messageSoundPlaying: false);
      }
    });
  }

  void computeAndPrintDuration() async {
    if (mounted) {
      // await audioPlayer.setSource(UrlSource(widget.message.messageSound!));

      await audioPlayer.getDuration();
    }
  }
}
