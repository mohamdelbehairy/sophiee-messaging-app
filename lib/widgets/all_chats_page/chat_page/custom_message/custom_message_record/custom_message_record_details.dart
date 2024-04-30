import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/utils/widget/messages/slider_sound.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CustomMessageRecordDetails extends StatelessWidget {
  const CustomMessageRecordDetails(
      {super.key,
      required this.size,
      required this.message,
      required this.duration,
      required this.position,
      required this.audioPlayer,
      required this.recordTimer,
      required this.isPlaying,
      required this.sliderWidth,
      required this.sliderColor});
  final Size size;
  final MessageModel message;
  final Duration duration;
  final Duration position;
  final AudioPlayer audioPlayer;
  final String recordTimer;
  final bool isPlaying;
  final double sliderWidth;
  final Color sliderColor;

  @override
  Widget build(BuildContext context) {
    String formattedTimer;
    List<String> parts = recordTimer.split(':');

    if (int.parse(parts[1]) < 10) {
      formattedTimer = '${parts[0]}0:0${parts[1]}';
    } else {
      formattedTimer = '${parts[0]}0:${parts[1]}';
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: size.width * .03),
            child: SliderSound(
                size: size,
                color: sliderColor,
                sliderHeight: size.width * .07,
                sliderWidth: sliderWidth,
                duration: duration,
                position: position,
                audioPlayer: audioPlayer)),
        Padding(
          padding:
              EdgeInsets.only(left: size.width * .06, top: size.width * .01),
          child: Text(isPlaying ? recordTimer : formattedTimer,
              style:
                  TextStyle(fontSize: size.width * .028, color: sliderColor)),
        )
      ],
    );
  }
}
