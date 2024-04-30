import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/chats/show_chat_video_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;
import 'package:video_player/video_player.dart';

class CustomMessageVideo extends StatefulWidget {
  const CustomMessageVideo(
      {super.key, required this.message, required this.user});
  final MessageModel message;
  final UserModel user;

  @override
  State<CustomMessageVideo> createState() => _CustomMessageVideoState();
}

class _CustomMessageVideoState extends State<CustomMessageVideo> {
  late VideoPlayerController _videoPlayerController;
  // late bool _isPlaying;

  @override
  void initState() {
    super.initState();
    // _isPlaying = false;

    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.message.messageVideo!),
    )..initialize().then((_) {
        setState(() {
          // _videoPlayerController.setLooping(false);
          // _isPlaying = true;
          // _videoPlayerController.addListener(_videoListener);
        });
      });
  }

  // void _videoListener() {
  //   if (_videoPlayerController.value.position ==
  //       _videoPlayerController.value.duration) {
  //     setState(() {
  //       // _isPlaying = false;
  //       // _videoPlayerController.pause();
  //       // _videoPlayerController.seekTo(Duration.zero);
  //     });
  //   }
  // }

  @override
  void dispose() {
    super.dispose();

    // _videoPlayerController.removeListener(_videoListener);
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SizedBox(
          // height: size.width * .8,
          width: size.width * .8,
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: widget.message.senderID ==
                        FirebaseAuth.instance.currentUser!.uid
                    ? const Radius.circular(24)
                    : const Radius.circular(0),
                bottomLeft: widget.message.senderID ==
                        FirebaseAuth.instance.currentUser!.uid
                    ? const Radius.circular(24)
                    : const Radius.circular(0),
                topRight: widget.message.senderID ==
                        FirebaseAuth.instance.currentUser!.uid
                    ? const Radius.circular(0)
                    : const Radius.circular(24),
                bottomRight: widget.message.senderID ==
                        FirebaseAuth.instance.currentUser!.uid
                    ? const Radius.circular(0)
                    : const Radius.circular(24),
              ),
              child: AspectRatio(
                  aspectRatio: 2 / 2.5,
                  child: VideoPlayer(_videoPlayerController))),
        ),
        if (!_videoPlayerController.value.isPlaying)
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                getnav.Get.to(
                    () => ShowChatVideoPage(
                        message: widget.message, user: widget.user),
                    transition: getnav.Transition.downToUp);
                // setState(() {
                //   if (_videoPlayerController.value.isPlaying) {
                //     _videoPlayerController.pause();
                //   } else {
                //     _videoPlayerController.play();
                //   }
                //   _isPlaying = !_isPlaying;
                // });
              },
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
          ),
        // if (_videoPlayerController.value.isPlaying)
        //   Positioned(
        //       bottom: size.height * .02,
        //       left: size.height * .02,
        //       child: GestureDetector(
        //         onTap: () {
        //           _videoPlayerController.pause();
        //           getnav.Get.to(
        //               () => ShowChatVideoPage(
        //                   message: widget.message, user: widget.user),
        //               transition: getnav.Transition.leftToRight);
        //         },
        //         child: Icon(FontAwesomeIcons.expand,
        //             color: Colors.white, size: size.width * .04),
        //       ))
      ],
    );
  }
}
