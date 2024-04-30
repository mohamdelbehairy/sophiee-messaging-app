import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/models/media_files_model.dart';
import 'package:sophiee/utils/widget/media_files_page/voice/custom_playing_icon.dart';

class TabBarVoiceListTileLeading extends StatefulWidget {
  const TabBarVoiceListTileLeading(
      {super.key, required this.size, required this.mediaFiles});

  final Size size;
  final MediaFilesModel mediaFiles;

  @override
  State<TabBarVoiceListTileLeading> createState() =>
      _TabBarVoiceListTileLeadingState();
}

class _TabBarVoiceListTileLeadingState
    extends State<TabBarVoiceListTileLeading> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPlayingIcon(
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
            await audioPlayer.play(UrlSource(
                widget.mediaFiles.messageRecord != null
                    ? widget.mediaFiles.messageRecord!
                    : widget.mediaFiles.messageSound!));
            setState(() {
              isPlaying = true;
            });
          }
        },
        size: widget.size,
        icon: isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play);
  }
}
