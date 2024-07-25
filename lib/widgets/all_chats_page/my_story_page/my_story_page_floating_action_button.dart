import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/pick_image/pick_image_cubit.dart';
import '../../../cubit/pick_image/pick_image_state.dart';
import '../../../cubit/pick_video/pick_video_cubit.dart';
import '../../../cubit/pick_video/pick_video_state.dart';
import '../add_story/add_story_image.dart';
import '../add_story/add_story_video.dart';

import 'package:get/get.dart' as getnav;

import 'my_story_page_floating_action_button_body.dart';

class MyStoryPageFloatingActionButton extends StatelessWidget {
  const MyStoryPageFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PickImageCubit, PickImageStates>(
      listener: (context, imageState) {
        if (imageState is PickImageSucccess) {
          getnav.Get.to(() => AddStoryImage(image: imageState.image),
              transition: getnav.Transition.rightToLeft);
        }
      },
      child: BlocListener<PickVideoCubit, PickVideoState>(
        listener: (context, videoState) {
          if (videoState is PickVideoSuccess) {
            getnav.Get.to(() => AddStoryVideo(video: videoState.video),
                transition: getnav.Transition.rightToLeft);
          }
        },
        child: const MyStoryPageFloatingActionButtonBody(),
      ),
    );
  }
}
