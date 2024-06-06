import 'package:get/get.dart' as getnav;
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:sophiee/cubit/pick_video/pick_video_cubit.dart';
import 'package:sophiee/cubit/pick_video/pick_video_state.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_image.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_pop_menu_item.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'add_story_live.dart';

class AddStoryPopMenuButton extends StatelessWidget {
  const AddStoryPopMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pickImage = context.read<PickImageCubit>();
    final pickVideo = context.read<PickVideoCubit>();

    return BlocListener<PickVideoCubit, PickVideoState>(
      listener: (context, state) {
        if (state is PickVideoSuccess) {
          getnav.Get.to(() => AddStoryVideo(video: state.video),
              transition: getnav.Transition.downToUp);
        }
      },
      child: BlocListener<PickImageCubit, PickImageStates>(
        listener: (context, state) {
          if (state is PickImageSucccess) {
            getnav.Get.to(() => AddStoryImage(image: state.image),
                transition: getnav.Transition.downToUp);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(size.width * .03),
          child: Column(
            children: [
              AddStoryPopoverItem(
                  text: 'photo',
                  icon: Icons.camera_alt_rounded,
                  onTap: () async {
                    await pickImage.pickImage(source: ImageSource.gallery);
                  }),
              SizedBox(height: size.height * .01),
              AddStoryPopoverItem(
                  text: 'video',
                  icon: Icons.video_collection,
                  onTap: () async {
                    await pickVideo.pickVideo(source: ImageSource.gallery);
                  }),
              SizedBox(height: size.height * .01),
              const AddStoryLive(),
            ],
          ),
        ),
      ),
    );
  }
}

