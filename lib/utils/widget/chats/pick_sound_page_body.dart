import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/utils/widget/messages/slider_sound.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_sound_page/custom_sound_time.dart';

class PickSoundPageBody extends StatefulWidget {
  const PickSoundPageBody({super.key, required this.size, required this.file});
  final Size size;
  final File file;

  @override
  State<PickSoundPageBody> createState() => _PickSoundPageBodyState();
}

class _PickSoundPageBodyState extends State<PickSoundPageBody> {
  bool isPlaying = false;
  late AudioPlayer audioPlayer;

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

    computeAndPrintDuration();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: widget.size.height * .1,
            width: widget.size.width,
            margin: EdgeInsets.symmetric(horizontal: widget.size.width * .05),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(widget.size.width * .03)),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: widget.size.width * .03),
                  child: GestureDetector(
                    onTap: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        audioPlayer.onPlayerComplete.listen((event) {
                          setState(() {
                            isPlaying = false;
                          });
                        });

                        await audioPlayer
                            .play(DeviceFileSource(widget.file.path));
                        setState(() {
                          isPlaying = true;
                        });
                      }
                    },
                    child: Icon(
                        isPlaying
                            ? FontAwesomeIcons.pause
                            : FontAwesomeIcons.play,
                        color: Colors.white),
                  ),
                ),
                SliderSound(
                    sliderWidth: widget.size.width * .8,
                    size: widget.size,
                    duration: duration,
                    position: position,
                    audioPlayer: audioPlayer)
              ],
            ),
          ),
          CustomSoundTime(
              size: widget.size,
              positionBottom: widget.size.height * .01,
              positionLeft: widget.size.height * .045,
              soundText: formatTime(position.inSeconds)),
          CustomSoundTime(
              size: widget.size,
              positionBottom: widget.size.height * .01,
              positionRight: widget.size.height * .045,
              soundText: formatTime((duration - position).inSeconds)),
        ],
      ),
    );
  }

  StreamSubscription<PlayerState> audioPlayerStateChanged() {
    return audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  void audioPlayerDurationChanged() {
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
  }

  void audioPlayerPositionChanged() {
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  StreamSubscription<void> audioPlayerComplete() {
    return audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        position = Duration.zero;
      });
    });
  }

  void computeAndPrintDuration() async {
    await audioPlayer.setSource(DeviceFileSource(widget.file.path));

    Duration? audioDuration = await audioPlayer.getDuration();

    debugPrint("مدة الصوت: ${formatTime(audioDuration!.inSeconds)}");
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
