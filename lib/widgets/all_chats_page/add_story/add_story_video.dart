import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophiee/cubit/story/story_cubit.dart';
import 'package:sophiee/cubit/story/story_state.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_share_bottom.dart';
import 'package:sophiee/widgets/all_chats_page/custom_chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../cubit/get_friends/get_friends_cubit.dart';
import '../../../cubit/get_friends/get_friends_state.dart';
import '../../../cubit/notification/story_notification/story_notification_cubit.dart';
import '../../../cubit/upload/upload_video/upload_video_cubit.dart';
import '../../../cubit/user_date/get_user_data/get_user_data_cubit.dart';
import '../../../cubit/user_date/get_user_data/get_user_data_state.dart';
import '../../../models/users_model.dart';

class AddStoryVideo extends StatefulWidget {
  const AddStoryVideo({super.key, required this.video});
  final File video;

  @override
  State<AddStoryVideo> createState() => _AddStoryVideoState();
}

class _AddStoryVideoState extends State<AddStoryVideo> {
  late VideoPlayerController _controller;
  TextEditingController controller = TextEditingController();
  Duration? videoDuration;

  @override
  void initState() {
    context
        .read<GetFriendsCubit>()
        .getFriends(userID: FirebaseAuth.instance.currentUser!.uid);
    context.read<GetUserDataCubit>().getUserData();
    super.initState();
    _controller = VideoPlayerController.file(
      File(widget.video.path),
    )..initialize().then((_) {
        setState(() {
          _controller.play();
          videoDuration = _controller.value.duration;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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

    return BlocListener<StoryCubit, StoryState>(
      listener: (context, state) {
        if (state is AddStorySuccess) {
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (context) => const HomePage()),
          //     (route) => false);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            VideoPlayer(_controller),
            Positioned(
              top: size.height * .09,
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.02,
              width: size.width,
              child: CustomChatTextField(
                hintText: 'Enter Type ....',
                controller: controller,
              ),
            ),
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
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                      String videoUrl = await uploadVideo.uploadVideo(
                          videoFile: widget.video, fieldName: 'stories_videos');
                      await story.addStory(
                          imageUrl: null,
                          videoUrl: videoUrl,
                          storyText: controller.text,
                          storyVideoTime: videoDuration?.inSeconds);
                      await story.updateIsStory(isStory: true);

                      for (var element in items!) {
                        var data = items2!
                            .firstWhere((e) => e.userID == element.userID);

                        if (data.isStoryNotify) {
                          await storyNotification.sendStoryNotification(
                              receiverToken: data.token,
                              senderName: user!.userName,
                              senderId: user!.userID);
                        }
                      }
                    },
                    child: const AddStoryShareBottom(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
