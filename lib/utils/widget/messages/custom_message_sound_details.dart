import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/utils/widget/messages/slider_sound.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_audio/message_sound_name.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_audio/message_sound_timer_details.dart';

class CustomMessageSoudDetails extends StatelessWidget {
  const CustomMessageSoudDetails(
      {super.key,
      required this.size,
      required this.message,
      required this.audioPlayer,
      required this.duration,
      required this.position,
      required this.nameColor});

  final Size size;
  final MessageModel message;
  final AudioPlayer audioPlayer;
  final Duration duration;
  final Duration position;
  final Color nameColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
            padding:
                EdgeInsets.only(left: size.width * .03, top: size.width * .03),
            child: MessageSoundName(
                size: size, message: message, nameColor: nameColor)),
        if (message.messageSoundPlaying == true)
          SliderSound(
              size: size,
              color: message.senderID == FirebaseAuth.instance.currentUser!.uid
                  ? Colors.white
                  : Colors.grey,
              sliderHeight: size.width * .07,
              sliderWidth: size.width * .6,
              duration: duration,
              position: position,
              audioPlayer: audioPlayer),
        if (message.messageSoundPlaying == true)
          MessageSoundTimerDetails(
              size: size,
              message: message,
              firstTimer: formatTime(position.inSeconds),
              lastTimer: formatTime((duration - position).inSeconds)),
      ],
    );
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
