import 'dart:io';

import 'package:sophiee/cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import 'package:sophiee/cubit/upload/upload_video/upload_video_cubit.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_chat_text_field.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_send_chat_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

import '../../../../../cubit/notification/group_notification/group_notification_cubit.dart';

class GroupsChatPickVideoPageBody extends StatefulWidget {
  const GroupsChatPickVideoPageBody(
      {super.key,
      required this.video,
      required this.groupModel,
      required this.tokens,
      required this.senderName,
      required this.isNotify});
  final File video;
  final GroupModel groupModel;
  final List<String> tokens;
  final String senderName;
  final List<bool> isNotify;

  @override
  State<GroupsChatPickVideoPageBody> createState() =>
      _GroupsChatPickVideoPageBodyState();
}

class _GroupsChatPickVideoPageBodyState
    extends State<GroupsChatPickVideoPageBody> {
  late VideoPlayerController _videoPlayerController;
  TextEditingController controller = TextEditingController();
  late bool _isPlaying;
  bool isClick = false;

  @override
  void initState() {
    super.initState();
    _isPlaying = false;
    _videoPlayerController = VideoPlayerController.file(
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

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.removeListener(_videoListener);
    _videoPlayerController.dispose();
  }

  navigation() {
    Navigation.navigationOnePop(context: context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sendMessage = context.read<GroupMessageCubit>();
    var uploadVideo = context.read<UploadVideoCubit>();
    var storeMedia = context.read<GroupStoreMediaFilesCubit>();
    var sendGroupMessageNotify = context.read<GroupNotificationCubit>();

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
                  child:
                      const Icon(FontAwesomeIcons.xmark, color: Colors.white))),
          Positioned(
            height: size.height * .18,
            width: size.width,
            bottom: 0.0,
            child: PickChatTextField(
              controller: controller,
              hintText: 'Enter a message..',
            ),
          ),
          Positioned(
            width: size.width,
            bottom: size.height * .015,
            child: GroupsChatSendItemChatBottom(
              groupModel: widget.groupModel,
              isClick: isClick,
              onTap: () async {
                try {
                  setState(() {
                    isClick = true;
                  });
                  String videoUrl = await uploadVideo.uploadVideo(
                      fieldName: 'groups_messages_videos',
                      videoFile: widget.video);
                  String messageID = const Uuid().v4();
                  await sendMessage.sendGroupMessage(
                      messageID: messageID,
                      messageText: controller.text,
                      groupID: widget.groupModel.groupID,
                      imageUrl: null,
                      videoUrl: videoUrl,
                      replayImageMessage: '',
                      friendNameReplay: '',
                      replayMessageID: '');

                  for (int i = 0; i < widget.tokens.length; i++) {
                    if (widget.isNotify[i]) {
                      sendGroupMessageNotify.sendGroupMessageNotification(
                          receiverToken: widget.tokens[i],
                          senderName: widget.groupModel.groupName,
                          message:
                              '${widget.senderName.split(' ')[0]} sent a video',
                          senderId: widget.groupModel.groupID);
                    }
                  }
                  await storeMedia.storeMedia(
                      groupID: widget.groupModel.groupID,
                      messageID: messageID,
                      messageVideo: videoUrl,
                      messageText:
                          controller.text.isNotEmpty ? controller.text : '');

                  if (controller.text.startsWith('http') ||
                      controller.text.startsWith('https')) {
                    await storeMedia.storeLink(
                        groupID: widget.groupModel.groupID,
                        messageID: messageID,
                        messageLink: controller.text);
                  }

                  navigation();
                } finally {
                  setState(() {
                    isClick = false;
                  });
                }
              },
            ),
          ),
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
}
