import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
import 'package:sophiee/constants.dart';

class RecorderItem extends StatelessWidget {
  const RecorderItem({
    super.key,
    required this.size,
    required this.sendRequestFunction, this.stopRecording,
  });
  final Size size;
  final Function(File soundFile, String time) sendRequestFunction;
  final Function(String)? stopRecording;

  @override
  Widget build(BuildContext context) {
    return SocialMediaRecorder(
        initRecordPackageWidth: size.height * .055,
        fullRecordPackageHeight: size.height * .055,
        radius: BorderRadius.circular(size.height * .05),
        backGroundColor: kPrimaryColor,
        recordIconBackGroundColor: kPrimaryColor,
        recordIconWhenLockBackGroundColor: kPrimaryColor,
        recordIcon: Icon(FontAwesomeIcons.microphone,
            color: Colors.white, size: size.height * .025),
        stopRecording: stopRecording,
        sendRequestFunction: sendRequestFunction,
        encode: AudioEncoderType.AAC);
  }
}
