import 'dart:io';

import 'package:sophiee/cubit/story/story_cubit.dart';
import 'package:sophiee/cubit/story/story_state.dart';
import 'package:sophiee/pages/home_page.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_share_bottom.dart';
import 'package:sophiee/widgets/all_chats_page/custom_chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class AddStoryVideo extends StatefulWidget {
  const AddStoryVideo({super.key, required this.video});
  final File video;

  @override
  State<AddStoryVideo> createState() => _AddStoryVideoState();
}

class _AddStoryVideoState extends State<AddStoryVideo> {
  late VideoPlayerController _controller;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(
      File(widget.video.path),
    )..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final story = context.read<StoryCubit>();
    return BlocListener<StoryCubit, StoryState>(
      listener: (context, state) {
        if (state is AddStorySuccess) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false);
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
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await story.addStory(
                      image: null,
                      video: widget.video,
                      context: context,
                      storyText: controller.text);
                  await story.updateIsStory(isStory: true);
                },
                child: const AddStoryShareBottom(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
