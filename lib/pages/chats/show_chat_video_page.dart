import 'package:sophiee/constants.dart';
import 'package:sophiee/models/media_files_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/media/save_video.dart';
import 'package:sophiee/utils/widget/media/share_media.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/show_chat_media/show_chat_media_appbar.dart';
import 'package:sophiee/widgets/show_toast.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:video_player/video_player.dart';

class ShowChatVideoPage extends StatefulWidget {
  const ShowChatVideoPage(
      {super.key, this.message, required this.user, this.mediaFiels});
  final MessageModel? message;
  final MediaFilesModel? mediaFiels;
  final UserModel user;

  @override
  State<ShowChatVideoPage> createState() => _ShowChatVideoPageState();
}

class _ShowChatVideoPageState extends State<ShowChatVideoPage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late bool _isVideoPlaying;

  @override
  void initState() {
    super.initState();
    _isVideoPlaying = false;

    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        widget.message != null
            ? widget.message!.messageVideo!
            : widget.mediaFiels!.messageVideo!));

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      showOptions: false,
    );
    _videoPlayerController.addListener(() {
      final isPlaying = _videoPlayerController.value.isPlaying;
      if (isPlaying != _isVideoPlaying) {
        setState(() {
          _isVideoPlaying = isPlaying;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  showToastMethod() {
    showToastMedthod(
        context: context,
        showToastText: 'Video saved successfully',
        position: StyledToastPosition.bottom);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: !_isVideoPlaying
          ? AppBar(
              titleSpacing: size.width * -.02,
              backgroundColor: kPrimaryColor,
              title: ShowChatMediaAppBar(
                  message: widget.message,
                  mediaFiels: widget.mediaFiels,
                  user: widget.user,
                  saveOnTap: () async {
                    await saveVideo(
                        videoUel: widget.message != null
                            ? widget.message!.messageVideo!
                            : widget.mediaFiels!.messageVideo!);
                    showToastMethod();
                  },
                  shareOnTap: () async {
                    await shareMedia(
                        mediaUrl: widget.message != null
                            ? widget.message!.messageVideo!
                            : widget.mediaFiels!.messageVideo!,
                        mediaType: 'video.mp4');
                  }),
            )
          : AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false),
      body: Chewie(controller: _chewieController),
    );
  }
}
