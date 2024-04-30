import 'dart:io';
import 'package:sophiee/cubit/story/story_cubit.dart';
import 'package:sophiee/cubit/story/story_state.dart';
import 'package:sophiee/pages/home_page.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_share_bottom.dart';
import 'package:sophiee/widgets/all_chats_page/custom_chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStoryImage extends StatefulWidget {
  const AddStoryImage({super.key, required this.image});
  final File image;

  @override
  State<AddStoryImage> createState() => _AddStoryImageState();
}

class _AddStoryImageState extends State<AddStoryImage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final story = context.read<StoryCubit>();
    return Scaffold(
      backgroundColor: Colors.black87,
      body: BlocListener<StoryCubit, StoryState>(
        listener: (context, state) {
          if (state is AddStorySuccess) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false);
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(widget.image),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
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
                      image: widget.image,
                      video: null,
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
