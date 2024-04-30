import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SliderSound extends StatelessWidget {
  const SliderSound(
      {super.key,
      required this.size,
      required this.duration,
      required this.position,
      required this.audioPlayer,
      required this.sliderWidth,
      this.sliderHeight,
      this.color = Colors.white});

  final Size size;
  final Duration duration;
  final Duration position;
  final AudioPlayer audioPlayer;
  final double sliderWidth;
  final double? sliderHeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sliderHeight,
      width: sliderWidth,
      child: Slider(
          min: 0,
          max: duration.inSeconds.toDouble(),
          value: position.inSeconds.toDouble(),
          activeColor: color,
          onChanged: (value) {
            final position = Duration(seconds: value.toInt());
            audioPlayer.seek(position);
            audioPlayer.resume();
          }),
    );
  }


  
}
