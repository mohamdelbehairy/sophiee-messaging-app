import 'package:flutter/material.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:video_player/video_player.dart';

class HighLightCustomVideo extends StatefulWidget {
  const HighLightCustomVideo(
      {super.key, required this.message, required this.size});
  final MessageModel message;
  final Size size;

  @override
  State<HighLightCustomVideo> createState() => _HighLightCustomVideoState();
}

class _HighLightCustomVideoState extends State<HighLightCustomVideo> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.message.messageVideo!),
    )..initialize().then((_) {});
  }

  @override
  void dispose() {
    super.dispose();

    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.width * .7,
      width: widget.size.width * .8,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
              aspectRatio: 2 / 2.5,
              child: VideoPlayer(_videoPlayerController))),
    );
  }
}
