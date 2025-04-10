import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophiee/cubit/story/story_cubit.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_share_bottom.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

import '../../../cubit/get_friends/get_friends_cubit.dart';
import '../../../cubit/get_friends/get_friends_state.dart';
import '../../../cubit/notification/store_notification/store_notification_cubit.dart';
import '../../../cubit/notification/story_notification/story_notification_cubit.dart';
import '../../../cubit/upload/upload_video/upload_video_cubit.dart';
import '../../../cubit/user_date/get_user_data/get_user_data_cubit.dart';
import '../../../cubit/user_date/get_user_data/get_user_data_state.dart';
import '../../../models/users_model.dart';
import '../chat_page/pick_chat_items/pick_video_page/pick_video_play.dart';

class AddStoryVideo extends StatefulWidget {
  const AddStoryVideo({super.key, required this.video});
  final File video;

  @override
  State<AddStoryVideo> createState() => _AddStoryVideoState();
}

class _AddStoryVideoState extends State<AddStoryVideo> {
  late VideoPlayerController videoPlayerController;
  TextEditingController controller = TextEditingController();
  Duration? videoDuration;
  late bool _isPlaying;

  @override
  void initState() {
    addStoryVideoInit();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    controller.dispose();
  }

  List<UserModel>? items;
  List<UserModel>? items2;
  UserModel? user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final story = context.read<StoryCubit>();
    var uploadVideo = context.read<UploadVideoCubit>();
    var storyNotification = context.read<StoryNotificationCubit>();
    var storeNotification = context.read<StoreNotificationCubit>();

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: GestureDetector(
        onTap: () {
          setState(() {
            if (videoPlayerController.value.isPlaying) {
              videoPlayerController.pause();
            } else {
              videoPlayerController.play();
            }
            _isPlaying = !_isPlaying;
          });
        },
        child: Stack(
          children: [
            VideoPlayer(videoPlayerController),
            AddStoryTextField(size: size, controller: controller),
            Positioned(
              bottom: size.height * .02,
              right: size.width * .02,
              child: BlocListener<GetFriendsCubit, GetFriendsState>(
                listener: (context, friendState) {
                  if (friendState is GetFriendsSuccess) {
                    items = friendState.friends;
                  }
                },
                child: BlocListener<GetUserDataCubit, GetUserDataStates>(
                  listener: (context, state) {
                    if (state is GetUserDataSuccess) {
                      items2 = state.userModel;
                      user = state.userModel.firstWhere((element) =>
                          element.userID ==
                          FirebaseAuth.instance.currentUser!.uid);
                    }
                  },
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await Future.delayed(const Duration(seconds: 1), () {
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      });
                      String storyID = const Uuid().v4();
                      String videoUrl = await uploadVideo.uploadVideo(
                          videoFile: widget.video, fieldName: 'stories_videos');
                      await story.addStory(
                          imageUrl: null,
                          videoUrl: videoUrl,
                          storyID: storyID,
                          storyText: controller.text,
                          storyVideoTime: videoDuration?.inSeconds);
                      await story.updateIsStory(
                          isStory: true,
                          userID: FirebaseAuth.instance.currentUser!.uid);

                      if (items != null) {
                        for (var element in items!) {
                          var data = items2!
                              .firstWhere((e) => e.userID == element.userID);

                          if (data.isStoryNotify) {
                            await storyNotification.sendStoryNotification(
                                receiverToken: data.token,
                                senderName: user!.userName,
                                senderId: user!.userID);
                          }
                          await storeNotification.storeNotification(
                              notificationID: storyID,
                              userID: data.userID,
                              notificationType: "video");
                        }
                      }
                    },
                    child: const AddStoryShareBottom(),
                  ),
                ),
              ),
            ),
            if (!videoPlayerController.value.isPlaying)
              PickVideoPlayVideo(size: size),
          ],
        ),
      ),
    );
  }

  void addStoryVideoInit() {
    context
        .read<GetFriendsCubit>()
        .getFriends(userID: FirebaseAuth.instance.currentUser!.uid);
    context.read<GetUserDataCubit>().getUserData();
    super.initState();
    _isPlaying = false;
    videoPlayerController = VideoPlayerController.file(
      File(widget.video.path),
    )..initialize().then((_) {
        setState(() {
          videoPlayerController.setLooping(false);
          _isPlaying = true;
          videoDuration = videoPlayerController.value.duration;
          videoPlayerController.addListener(_videoListener);
        });
      });
  }

  VideoPlayerController videoPayerMethod() {
    return VideoPlayerController.file(
      File(widget.video.path),
    )..initialize().then((_) {
        videoPlayerController.setLooping(false);
        _isPlaying = true;
        videoPlayerController.addListener(_videoListener);
      });
  }

  void _videoListener() {
    if (videoPlayerController.value.position ==
        videoPlayerController.value.duration) {
      setState(() {
        _isPlaying = false;
        videoPlayerController.pause();
        videoPlayerController.seekTo(Duration.zero);
      });
    }
  }
}
