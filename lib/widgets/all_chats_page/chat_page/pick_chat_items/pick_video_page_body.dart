import 'dart:io';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_chat_text_field.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_video_send_video_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class PickVideoPageBody extends StatefulWidget {
  const PickVideoPageBody({super.key, required this.video, required this.user});
  final File video;
  final UserModel user;

  @override
  State<PickVideoPageBody> createState() => _PickVideoPageBodyState();
}

class _PickVideoPageBodyState extends State<PickVideoPageBody> {
  late VideoPlayerController _videoPlayerController;
  TextEditingController controller = TextEditingController();
  late bool _isPlaying;

  @override
  void initState() {
    super.initState();
    _isPlaying = false;
    _videoPlayerController = videoPayerMethod();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.removeListener(_videoListener);
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return GestureDetector(
      onTap: () {
        setState(() {
          if (_videoPlayerController.value.isPlaying) {
            _videoPlayerController.pause();
          } else {
            _videoPlayerController.play();
          }
          _isPlaying = !_isPlaying;
        });
      },
      child: Stack(
        children: [
          Center(
            child: SizedBox(
                height: size.height,
                width: size.width,
                child: VideoPlayer(_videoPlayerController)),
          ),
          Positioned(
              top: size.height * .08,
              left: size.width * .05,
              child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(FontAwesomeIcons.xmark, color: Colors.white))),
          Positioned(
            height: size.height * .18,
            width: size.width,
            bottom: 0.0,
            child: PickChatTextField(
              controller: controller,
              hintText: 'Enter a message..',
            ),
          ),
          PickVideoSendVideoMessageButton(
              size: size,
              user: widget.user,
              video: widget.video,
              controller: controller),
          if (!_videoPlayerController.value.isPlaying)
            Positioned.fill(
              child: Center(
                child: CircleAvatar(
                  backgroundColor: const Color(0xff585558).withOpacity(.3),
                  child: Icon(
                    FontAwesomeIcons.play,
                    color: Colors.white,
                    size: size.width * .05,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  VideoPlayerController videoPayerMethod() {
    return VideoPlayerController.file(
      File(widget.video.path),
    )..initialize().then((_) {
        _videoPlayerController.setLooping(false);
        _isPlaying = true;
        _videoPlayerController.addListener(_videoListener);
      });
  }

  void _videoListener() {
    if (_videoPlayerController.value.position ==
        _videoPlayerController.value.duration) {
      setState(() {
        _isPlaying = false;
        _videoPlayerController.pause();
        _videoPlayerController.seekTo(Duration.zero);
      });
    }
  }
}

